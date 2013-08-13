require 'spec_helper'

describe City do
  it "should return a valid city age" do
    City.generate_city_age.to_i.should <= Figaro.env.max_city_age.to_i
    City.generate_city_age.to_i.should >= 0
  end
end
