class CityGenTools
  def self.get_hash_value(hash, key, chance=100)
    if chance > rand(100)
      value = hash[key].is_a?(String) ? hash[key] : hash[key][rand(hash[key].length)]
    end
    value || ''
  end
end