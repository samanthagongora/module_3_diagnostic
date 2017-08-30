require 'rails_helper'

RSpec.describe "as a user" do
  scenario "can search by zip code" do
    VCR.use_cassette("/user_can_search_by_zip_code_spec") do
      visit root_path
      fill_in 'q', with: "80203"
      click_on "Locate"

      expect(current_path).to eq("/search")
      # expect(params[:q]).to eq("80203")
    end
  end
end

# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
