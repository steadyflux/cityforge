require 'spec_helper'

describe City do
  context 'when generating city age' do
    it "should return a valid city age" do
      age = City.generate_city_age.to_i
      if age > Figaro.env.max_city_age.to_i || age <= 0
        found "Found an invalid city age: #{age}"
      end
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
end
