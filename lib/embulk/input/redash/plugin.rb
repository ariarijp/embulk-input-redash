require_relative './client'
require_relative './converter'

module Embulk
  module Input
    module Redash
      # Redash input plugin for Embulk
      class Plugin < InputPlugin
        ::Embulk::Plugin.register_input('redash', self)

        def self.transaction(config, &_control)
          task = {
            url: config.param('url', :string),
            api_key: config.param('api_key', :string)
          }

          columns = embulk_columns(config)

          task_reports = yield(task, columns, 1)

          task_reports.first
        end

        def self.guess(config)
          sample_records = Client.get_rows(config['url'], config['api_key'])
                                 .first(10)
          columns = Guess::SchemaGuess.from_hash_records(sample_records)
          { columns: columns }
        end

        def init
          @url = task['url']
          @api_key = task['api_key']
        end

        def run
          Client.get_rows(@url, @api_key).each do |row|
            values = schema.map do |col|
              Converter.convert(col.type, row[col.name])
            end
            page_builder.add(values)
          end

          page_builder.finish

          {}
        end

        def self.embulk_columns(config)
          config.param(:columns, :array).map do |column|
            name = column['name']
            type = column['type'].to_sym
            format = column['format']

            Column.new(nil, name, type, format)
          end
        end
      end
    end
  end
end
