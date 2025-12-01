require 'net/http'
require 'uri'

module TwentyFive
  module FetchInput
    def self.call(day)
      session = ENV['AOC_SESSION']

      uri = URI("https://adventofcode.com/2025/day/#{day}/input")

      request = Net::HTTP::Get.new(uri)
      request['Cookie'] = "session=#{session}"

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      response.body
    end
  end
end
