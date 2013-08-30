class City < ActiveRecord::Base

  @@city_data_hash ||= Hash.from_xml(Nokogiri::XML(File.read(Figaro.env.xml_base + Figaro.env.city_data_file)).to_s)

  def self.build_new_city
    c = City.new
    c.name = CityName.generate_city_name
    c.age = City.generate_city_age
    City.generate_base_stats.each do |k,v|
      c[k] = v
    end
    City.generate_alignment.each do |k,v|
      c[k] = v
    end
    City.generate_size.each do |k,v|
      c[k] = v if c.attributes.has_key? k
    end
    c
  end

  #TODO modify city age by size_modifier
  #TODO factor this whole section to its own place ... grumble grumble skinny models
  def self.generate_city_age(age=nil)
    age_hash = GenerationTools.get_hash_attrs(@@city_data_hash["data"]["cityages"], "cityage", age)
    min = age_hash["min"].nil? ? 0 : age_hash["min"]
    max = age_hash["max"].nil? ? Figaro.env.max_city_age.to_i : age_hash["max"]
    age_delta = max - min 
    age_hash["city_age"] = GenerationTools.d(age_delta) + min
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
    size_hash = GenerationTools.get_hash_attrs(@@city_data_hash["data"]["citysize"], "city", size)
    size_delta = size_hash["maxpop"] - size_hash["minpop"]
    size_hash["population_estimate"] = GenerationTools.d(size_delta) + size_hash["minpop"]
    size_hash
  end

end
