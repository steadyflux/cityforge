class City < ActiveRecord::Base

  def self.generate_city_age
    rand(5000).to_s
  end

end
