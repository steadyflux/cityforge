require 'spec_helper'
require 'generic_test_helper'

describe Demographics do

  include GenericTestHelper

  context 'when generating city demographics' do
    it 'should generate a known population type without input' do
      hash = Demographics.set_population_type
      # <pop_type type="mixed" base_pop="mixed"   />
      hash["base_pop"].should == "mixed"
      hash["type"].should == "mixed"
    end

    it "should return a known population type with named input" do
      random_base_pop = random_string
      pop_hash =  {"type"=>"monster", "base_pop"=>random_base_pop}
      GenerationTools.should_receive(:get_hash_attrs).with(an_instance_of(Hash),an_instance_of(String),"monster").and_return(pop_hash)
      hash = Demographics.set_population_type("monster")
      hash["base_pop"].should == random_base_pop
      hash["type"].should == "monster"
    end

  end
end