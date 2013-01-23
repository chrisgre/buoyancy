require "buoyancy/version"
require "buoyancy/connection"

module Buoyancy

  def self.connection
    @connection ||= Connection.new
  end

  def self.stations
    connection.get("stations/station_table.txt").body.split("\n").drop(2).each_with_object([]) do |station, array|
      station_parts = station.split("|")
      station_parts.map! { |part| part.strip unless part.nil? }
      station_parts.map! { |part| (part == "" || part == "?") ? nil : part }

      array << {
        id:         station_parts[0],
        owner:      station_parts[1],
        type:       station_parts[2],
        hull:       station_parts[3],
        name:       station_parts[4],
        payload:    station_parts[5],
        location:   extract_location(station_parts[6]),
        time_zone:  station_parts[7],
        forecast:   station_parts[8],
        note:       station_parts[9]
      }
    end
  end

  def self.extract_location(location)
    return location unless location.match(/(\d+\.\d+\s(N|S|W|E)\s){2}\(.+\)$/)

    location.gsub!(/\s{1}\(.+\)/, "")
    parts = location.split(" ")

    longitude_number = parts[0].to_f
    latitude_number  = parts[2].to_f
    longitude_sign   = parts[1]
    latitude_sign    = parts[3]
    longitude        = longitude_sign == "N" ? +longitude_number : -longitude_number
    latitude         = latitude_sign  == "W" ? -latitude_number  : +latitude_number

    {
      longitude: longitude,
      latitude:  latitude
    }
  end

end
