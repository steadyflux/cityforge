class CityBaseStats
  @@base_stats = [ "education", "authority", "magic", "military", "tolerance", "economy" ]
  def self.generate_base_stats
    #taken from the CityGenerator.pm ... this generates values from -4 to 5 ... WHY?
    Hash[@@base_stats.map { |k, v| [k.to_sym, [-5, [5,(CityGenTools.d(11)-5)].min].max]}]
  end
end