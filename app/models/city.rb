class City < ActiveRecord::Base

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

  def self.generate_city_age
    rand(Figaro.env.max_city_age.to_i).to_s
  end

  def self.generate_base_stats
    base_attr = [ "education", "authority", "magic", "military", "tolerance", "economy"]
    #taken from the CityGenerator.pm ... this generates values from -4 to 5 ... WHY?
    Hash[base_attr.map { |k, v| [k.to_sym, [-5, [5,(CityGenTools.d(11)-5)].min].max]}]
  end

  def self.generate_alignment
    #taken from the CityGenerator.pm ... this generates values from -4 to 5 ... WHY?
    Hash[[:moral, :order].map { |k, v| [k.to_sym, CityGenTools.d(100)]}]
  end

  def self.generate_size

  end

end
