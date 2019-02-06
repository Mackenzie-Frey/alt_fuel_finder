require 'rails_helper'

describe 'As a User visiting / I fill in the search form' do
  it 'See a list of stations and their info' do
    visit '/'
    fill_in "q", with: "80203"
    click_on 'Locate'

    expect(current_path).to eq('/search')

    expect(page).to have_content("10 Results")

    within(first('.station')) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_types")
      expect(page).to have_css(".access_times")
    end

  end

end
