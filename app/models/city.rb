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
    c
  end

  #TODO modify city age by size_modifier
  def self.generate_city_age
    rand(Figaro.env.max_city_age.to_i).to_s
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
      Hash[base_attr.map { |k, v| [k.to_sym, [-5, [5,(CityGenTools.d(11)-5)].min].max]}]
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
    Hash[alignment_attr.map { |k, v| [k.to_sym, CityGenTools.d(100)]}]
  end

  def self.generate_size
    size_hash = CityGenTools.get_hash_value(@@city_data_hash["data"]["citysize"], "city")
    puts size_hash
  end

end
