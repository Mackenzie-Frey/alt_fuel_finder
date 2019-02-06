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
  # My next steps would be to refactor by moving the logic in the SearchController index method into the StationService.
  # I would also break out those methods in accordance with the Single Responsibility Principle.
  # From there I would calculate the distance of the station from the zip code searched and print
  # it to the page for each station, with first integrating a test to insure it appears to the page, along with a model test to insure my caluculation is correct.
  # I would also test my sort method for distance on a model and feature level.
  # I recognize my testing for the api could be made more verbose.

end
