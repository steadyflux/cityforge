class Demographics
  def self.set_population_type(type=nil)
    pop_hash = GenerationTools.get_hash_attrs(CITY_DATA_HASH["data"]["pop_types"], "pop_type", type)
    pop_hash
  end

  def self.set_available_races
    raise NotImplementedError
  end

  def self.generate_race_percentages
    raise NotImplementedError
  end

  def self.set_races
    raise NotImplementedError
  end

  def self.recalculate_populations
    raise NotImplementedError
  end

  def self.generate_citizens
    raise NotImplementedError
  end

  def self.generate_children
    raise NotImplementedError
  end

  def self.generate_elderly
    raise NotImplementedError
  end

  def self.generate_imprisonment_rate
    raise NotImplementedError
  end
end