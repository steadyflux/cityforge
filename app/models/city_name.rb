class CityName

  def self.generate_city_name
    @@name_hash ||= Hash.from_xml(Nokogiri::XML(File.read(Figaro.env.xml_base + Figaro.env.city_name_file)).to_s)["cityname"]
    hash = @@name_hash
    cityname = ""
    cityname << CityGenTools.get_hash_value(hash, "title", hash["title_chance"].to_i) + ' '
    cityname << CityGenTools.get_hash_value(hash, "pre", hash["pre_chance"].to_i) + ' '
    cityname << CityGenTools.get_hash_value(hash, "root")
    cityname << CityGenTools.get_hash_value(hash, "post")
    cityname << ' ' + CityGenTools.get_hash_value(hash, "trailer", hash["trailer_chance"].to_i)
    cityname.strip.squeeze
  end
end