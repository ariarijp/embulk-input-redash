module Embulk
  module Input
    module Redash
      class Converter
        def self.convert(type, value)
          case type
          when :timestamp
            Time.parse(value)
          else
            value
          end
        end
      end
    end
  end
end