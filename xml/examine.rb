require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

def get_hash_value(hash, key, chance=100)
  if chance > rand(100)
    value = hash[key][rand(hash[key].length)]
  end
  value || ''
end

doc ||= Nokogiri::XML(File.read("citynames.xml"))
name_hash = Hash.from_xml(doc.to_s)

5.times do |i|
  cityname = ""

  cityname << get_hash_value(name_hash["cityname"], "title", name_hash["cityname"]["title_chance"].to_i) + ' '
  cityname << get_hash_value(name_hash["cityname"], "pre", name_hash["cityname"]["pre_chance"].to_i) + ' '
  cityname << get_hash_value(name_hash["cityname"], "root")
  cityname << get_hash_value(name_hash["cityname"], "post")
  cityname << ' ' + get_hash_value(name_hash["cityname"], "trailer", name_hash["cityname"]["trailer_chance"].to_i)

  puts "#{i}: #{cityname.strip.squeeze}"
end
