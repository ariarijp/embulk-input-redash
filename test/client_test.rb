require 'json'
require 'test_helper'
require 'embulk/input/redash/client'

Client = Embulk::Input::Redash::Client

class ClientTest < Test::Unit::TestCase
  def test_get_rows()
    url = 'http://example.com/api/queries/123/results.json'
    api_key = 'veryverysecret'

    stub_body = {
      'query_result': {
        'data': {
          'rows': [
            {'foo': 'hoge', 'bar': 'fuga'},
          ],
          'columns': [
            {'name': 'foo', 'type': 'string', 'friendly_name': 'foo'},
            {'name': 'bar', 'type': 'integer', 'friendly_name': 'foo'},
          ],
        },
        'id': 123,
        'data_source_id': 1,
      }
    }

    stub_request(:get, "#{url}?api_key=#{api_key}").
      to_return(status: 200, body: stub_body.to_json(), headers: {})

    assert_equal([{'foo' => 'hoge', 'bar' => 'fuga'}], Client.get_rows(url, api_key))
  end
end