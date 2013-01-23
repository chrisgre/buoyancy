require File.expand_path("../../test_helper", __FILE__)
require "buoyancy/connection"

describe Buoyancy::Connection do

  it "creates a Faraday connection" do
    connection = stub
    Faraday.expects(:new).with(url: "http://www.ndbc.noaa.gov/data").returns(connection)
    Buoyancy::Connection.new.must_equal connection
  end

end
