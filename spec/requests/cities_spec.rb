require 'spec_helper'

describe "Cities" do
  describe "GET /cities" do
    it "display some tasks" do
      visit cities_path
      page.should have_content "Bream"
    end
  end
end
