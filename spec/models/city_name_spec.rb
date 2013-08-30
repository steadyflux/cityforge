require 'spec_helper'

describe CityName do

  it "should return a known name" do
    CityName.generate_city_name.should == "Great La Karnatheria Acres"
  end

  it "should return a valid name with all pieces" do
    ["title", "pre", "trailer"].each do |s|
      GenerationTools.should_receive(:get_hash_value).with(an_instance_of(Hash),s, 100).and_return(s)
    end
    ["root", "post"].each do |s|
      GenerationTools.should_receive(:get_hash_value).with(an_instance_of(Hash),s).and_return(s)
    end
    
    CityName.generate_city_name.should == "title pre rootpost trailer"
  end

  it "should return a valid name with only root and post" do
    ["title", "pre", "trailer"].each do |s|
      GenerationTools.should_receive(:get_hash_value).with(an_instance_of(Hash),s, 100).and_return('')
    end
    ["root", "post"].each do |s|
      GenerationTools.should_receive(:get_hash_value).with(an_instance_of(Hash),s).and_return(s)
    end
    
    CityName.generate_city_name.should == "rootpost"
  end
  
end