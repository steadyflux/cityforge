require 'spec_helper'

describe CityGenTools do

  it 'should roll a d1' do
    CityGenTools.d(1) == 1
  end

  it 'should roll a d20' do
    CityGenTools.d(20) <= 20
    CityGenTools.d(20) >= 1
  end

end