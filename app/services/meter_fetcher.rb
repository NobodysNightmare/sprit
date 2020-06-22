# frozen_string_literal: true

class MeterFetcher
  Error = Class.new(StandardError)
  Result = Struct.new(:energy, :cost)

  class << self
    def usage_between(serial, from:, to:)
      response = client.get(
        "/api/meters/#{serial}/usage",
        headers: headers,
        query: {
          from: from.iso8601,
          to: to.iso8601
        }
      )

      validate_response! response

      format_result response.parsed_response
    end

    private

    def client
      @client ||= Class.new do
        include HTTParty
        base_uri ENV.fetch('ENERGY_HOST')
      end
    end

    def headers
      {
        Authorization: "Bearer #{ENV.fetch('ENERGY_API_KEY')}"
      }
    end

    def validate_response!(response)
      return if response.code == 200

      if response.key?('error')
        raise Error, response['error']
      end

      raise Error, "Unexpected error while fetching meter usage (Status #{response.code})"
    end

    def format_result(hash)
      Result.new(hash.fetch('energy'), hash.fetch('cost'))
    end
  end
end
