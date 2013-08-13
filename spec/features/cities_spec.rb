require 'spec_helper'

describe "Cities" do
  describe "GET /cities" do
    it "display some cities" do
      @city = City.create :name => "Bream", :age => "55"
      visit cities_path
      page.should have_content "Bream"
    end

    # it "creates a new city" do
    #   visit cities_path
    #   fill_in 'Name', :with => 'Doren'
    #   click_button 'Create City'
    #   page.should have_content "Doren"

    #   save_and_open_page
    # end

  end
end