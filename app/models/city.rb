class City < ActiveRecord::Base

  def self.build_new_city
    c = City.new
    c[:age] = Hash.new
    c.name = CityName.generate_city_name
    City.generate_base_stats.each do |k,v|
      c[k] = v
    end
    City.generate_alignment.each do |k,v|
      c[k] = v
    end
    City.generate_size.each do |k,v|
      c[k] = v if c.attributes.has_key? k
    end
    City.generate_city_age.each do |k,v|
      c[k] = v if c.attributes.has_key? k
    end
    c
  end

  #TODO factor this whole section to its own place ... grumble grumble skinny models
  def self.generate_city_age(age=nil)
    age_hash = GenerationTools.get_hash_attrs(CITY_DATA_HASH["data"]["cityages"], "cityage", age)
    age_hash["age_modifier"] = age_hash["age_mod"]
    age_hash["age_description"] = age_hash["description"]
    age_hash
  end

  def self.generate_base_stats(stat_array=nil)
    base_attr = [ "education", "authority", "magic", "military", "tolerance", "economy"]
    if stat_array
      raise ("Wrong number of elements passed, expected #{base_attr.length} received #{stat_array.length}") unless stat_array.length == base_attr.length
      if stat_array.reject! {|stat| (stat > 5 || stat < -4) }
        raise ("Invalid value passed in stat array: #{stat_array}")
      end
      
      Hash[base_attr.zip(stat_array)]
    else
      #taken from the CityGenerator.pm ... this generates values from -4 to 5 ... WHY?
      Hash[base_attr.map { |k, v| [k.to_sym, [-5, [5,(GenerationTools.d(11)-5)].min].max]}]
    end
  end

  def self.generate_alignment(stat_array=nil)
    alignment_attr = ["moral", "order"]
    if stat_array
      raise ("Wrong number of elements passed, expected #{alignment_attr.length} received #{stat_array.length}") unless stat_array.length == alignment_attr.length
      if stat_array.reject! {|stat| (stat < 1 || stat > 100) }
        raise ("Invalid value passed in stat array: #{stat_array}")
      end
    end
    Hash[alignment_attr.map { |k, v| [k.to_sym, GenerationTools.d(100)]}]
  end

  def self.generate_size(size=nil)
    size_hash = GenerationTools.get_hash_attrs(CITY_DATA_HASH["data"]["citysize"], "city", size)
    size_delta = size_hash["maxpop"] - size_hash["minpop"]
    size_hash["population_estimate"] = GenerationTools.d(size_delta) + size_hash["minpop"]
    size_hash
  end
end
