require 'net/http'
require 'uri'
require 'openssl'

module TwentyFive
  module FetchInput
    def self.call(day)
      session = ENV['AOC_SESSION']

      uri = URI("https://adventofcode.com/2025/day/#{day}/input")

      request = Net::HTTP::Get.new(uri)
      request['Cookie'] = "session=#{session}"
      request['User-Agent'] = 'jspencerlucas@gmail.com'

      response = Net::HTTP.start(
        uri.hostname,
        uri.port,
        use_ssl: true,
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      ) do |http|
        http.request(request)
      end

      response.body
    end
  end
end
