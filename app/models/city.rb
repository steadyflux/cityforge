class City < ActiveRecord::Base

  def self.generate_city_age
    rand(Figaro.env.max_city_age.to_i).to_s
  end

end
