require 'rails_helper'

RSpec.describe "as a user" do
  scenario "can search by zip code" do
    visit root_path
    fill_in 'search', with: "80203"
    click_on "locate"

    expect(current_path).to eq("/search?zip_code=80203")
  end
end

# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
