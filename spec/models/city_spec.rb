require 'spec_helper'

describe City do
  context 'when generating city age' do

    it 'should generate a known age without input' do
      hash = City.generate_city_age
      hash["description"].should == "mature"
      hash["age_modifier"].should == -3
      hash["age_description"].should == "mature"
    end

    it "should return a valid city age with named input" do
      age_hash =  {"description"=>"elderly", "age_mod"=>-8}
      GenerationTools.should_receive(:get_hash_attrs).with(an_instance_of(Hash),an_instance_of(String),"elderly").and_return(age_hash)
      hash = City.generate_city_age("elderly")
      hash["age_modifier"].should == -8
      hash["age_description"].should == "elderly"
    end
    
  end

  context 'when generating city base stats' do
    it "should generate valid stats without input" do
      hash = City.generate_base_stats
      if hash.reject! {|k,v| v > 5 || v < -4}
        fail "Found an invalid value in generated stats: #{hash}"
      end
    end

    it "should generate valid stats with valid inputs" do
      stats = [-4,-3,-4,5,3,0]
      hash = City.generate_base_stats(stats)
      if hash.reject! {|k,v| v > 5 || v < -4 }
        fail "Found an invalid value in input stats: #{stats}"
      end
    end

    it "should fail to generate stats with invalid inputs" do
      stats = [-67,-3,-4,5,3,0]
        expect{City.generate_base_stats(stats)}.to raise_error
    end

    it "should reject requests with the wrong number of inputs" do
      stats = [1,1,1]
      expect{City.generate_base_stats(stats)}.to raise_error
      stats = [1,1,1,1,1,1,1,1,1]
      expect{City.generate_base_stats(stats)}.to raise_error
    end
  end

  context 'when generating city alignment' do

    it "should generate valid stats without input" do
      hash = City.generate_alignment
      if hash.reject! {|k,v| v < 1 || v > 100}
        fail "Found an invalid value in generated stats: #{hash}"
      end
    end

    it "should fail to generate stats with invalid inputs" do
      stats = [1, 100]
      hash = City.generate_alignment(stats)
      if hash.reject! {|k,v| v < 1 || v > 100 }
        fail "Found an invalid value in input stats: #{stats}"
      end
    end
    
    it "should fail to generate stats with invalid inputs" do
      stats = [-500, 200]
        expect{City.generate_alignment(stats)}.to raise_error
    end

    it "should reject requests with the wrong number of inputs" do
      stats = [1,1,1,1]
      expect{City.generate_alignment(stats)}.to raise_error
    end
  end

  context 'when generating city size' do
    it 'should generate a known size without input' do
      hash = City.generate_size
      hash["size"].should == "large town"
      hash["size_modifier"].should == 2
      hash["min_density"].should == 110
      hash["max_density"].should == 10000
      assert (3501..5000).include? hash["population_estimate"]
    end

    it 'should generate a valid size with named input' do
      city_hash = {
        "size"=>"city", 
        "size_modifier" => 6, "minpop"=> 8001, "maxpop"=> 15000,
        "min_density" => 180, "max_density" => 22000, "gplimit"=> 15000}
      GenerationTools.should_receive(:get_hash_attrs).with(an_instance_of(Hash),an_instance_of(String),"city").and_return(city_hash)
      hash = City.generate_size("city")
      hash["size"].should == "city"
      hash["size_modifier"].should == 6
      hash["min_density"].should == 180
      hash["max_density"].should == 22000
      assert (8001..15000).include? hash["population_estimate"]
    end

  end

end
