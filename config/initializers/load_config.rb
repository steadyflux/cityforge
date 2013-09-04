APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

CITY_DATA_HASH = Hash.from_xml(Nokogiri::XML(File.read(APP_CONFIG['xml_base'] + "citydata.xml")).to_s)
CITY_NAME_HASH = Hash.from_xml(Nokogiri::XML(File.read(APP_CONFIG['xml_base'] + "citynames.xml")).to_s)