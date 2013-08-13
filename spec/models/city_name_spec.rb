require 'spec_helper'

describe CityName do
  it "should return a known name" do
    CityName.generate_city_name.should == "Great La Karnatheria Acres"
  end
end