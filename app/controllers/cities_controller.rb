class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def generate
    # City.create
    if params[:city][:name].blank?
      params[:city][:name] = CityName.generate_city_name
    end
    if params[:city][:age].blank?
      params[:city][:age] = City.generate_city_age
    end



  end

  def post_params
    params.require(:city).permit(:name, :age)
  end


end
