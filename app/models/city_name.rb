class CityName

  def self.generate_city_name
    @@name_hash ||= Hash.from_xml(Nokogiri::XML(File.read(Figaro.env.XML_BASE + "citynames.xml")).to_s)
    hash = @@name_hash["cityname"] 
    cityname = ""
    cityname << GenerationTools.get_hash_value(hash, "title", hash["title_chance"].to_i) + ' '
    cityname << GenerationTools.get_hash_value(hash, "pre", hash["pre_chance"].to_i) + ' '
    cityname << GenerationTools.get_hash_value(hash, "root")
    cityname << GenerationTools.get_hash_value(hash, "post")
    cityname << ' ' + GenerationTools.get_hash_value(hash, "trailer", hash["trailer_chance"].to_i)
    cityname.squish
  end

end