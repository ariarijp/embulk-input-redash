require 'rest-client'

module Embulk
  module Input
    module Redash
      # Redash API client
      class Client
        def self.get_rows(url, api_key)
          res = RestClient.get(url, params: { api_key: api_key })
          data = JSON.parse(res.body)

          data['query_result']['data']['rows']
        end
      end
    end
  end
end
