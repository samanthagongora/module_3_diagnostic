require 'rails_helper'

RSpec.describe "as a user" do
  scenario "can search by zip code" do
    VCR.use_cassette("/user_can_search_by_zip_code_spec") do
      visit root_path
      fill_in 'q', with: "80203"
      click_on "Locate"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Wells Fargo Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("1700 Sherman Street")
      expect(page).to have_content("80203")
      expect(page).to have_content("MO: 12:00am-12:00am; TU: 12:00am-12:00am; WE: 12:00am-12:00am; TH: 12:00am-12:00am; FR: 12:00am-12:00am; SA: 12:00am-12:00am; SU: 12:00am-12:00am")
    end
  end
end
