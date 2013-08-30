class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def generate
    params[:city][:name] = CityName.generate_city_name if params[:city][:name].blank?
    params[:city][:age] = City.generate_city_age if params[:city][:age].blank?
    # City.create
  end

  def post_params
    params.require(:city).permit(:name, :age)
  end

end
