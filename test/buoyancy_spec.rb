require File.expand_path("../test_helper", __FILE__)
require "buoyancy"

describe Buoyancy do

  it "gets a list of stations" do
    body = "#\n#\n0y2w3|CG|Weather Station|Adamantium|Some Island|A bomb|That way|?| ||"
    response   = mock { expects(:body).returns(body) }
    connection = mock { expects(:get).with("stations/station_table.txt").returns(response) }
    Buoyancy.expects(:connection).returns(connection)
    Buoyancy.stations.must_equal [{
      id:        "0y2w3",
      owner:     "CG",
      type:      "Weather Station",
      hull:      "Adamantium",
      name:      "Some Island",
      payload:   "A bomb",
      location:  "That way",
      time_zone: nil,
      forecast:  nil,
      note:      nil
    }]
  end

  it "extracts a longitude and latitude from a location string with North and West coordinates" do
    location = "44.794 N 87.313 W (44&#176;47'40\" N 87&#176;18'47\" W)"
    Buoyancy.extract_location(location).must_equal({ longitude: 44.794, latitude: -87.313 })
  end

  it "extracts a longitude and latitude from a location string with South and East coordinates" do
    location = "44.794 S 87.313 E (44&#176;47'40\" N 87&#176;18'47\" W)"
    Buoyancy.extract_location(location).must_equal({ longitude: -44.794, latitude: 87.313 })
  end

end
