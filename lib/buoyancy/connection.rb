require "faraday"

module Buoyancy
  class Connection

    def self.new
      Faraday.new(url: "http://www.ndbc.noaa.gov/data") do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

  end
end
