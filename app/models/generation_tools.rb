module GenerationTools
  def self.get_hash_value(hash, key, chance=100)
    if chance > rand(100)
      value = hash[key].is_a?(String) ? hash[key] : hash[key][rand(hash[key].length)]
    end
    value || ''
  end

  def self.get_hash_attrs(hash, key, name=nil)
    if name
      attrs = hash[key][name]
    else
      attrs = hash[key].is_a?(Hash) ? hash[key] : hash[key][rand(hash[key].length)]
    end
    attrs.each {|k,v| attrs[k] = v.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? v : v.to_i }
  end


  def self.d(side)
    if side.is_a? Integer
      rand(side) + 1
    else
      raise "Invalid dice roll #{side}"
    end
  end
end