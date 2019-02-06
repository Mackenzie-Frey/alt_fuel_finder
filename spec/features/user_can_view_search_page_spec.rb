require 'rails_helper'

describe 'As a User visiting / I fill in the search form' do
  it 'See a list of stations and their info' do
    visit '/'
    click_on 'Locate'

    expect(current_path).to eq('/search')

    expect(returned_array.count).to eq(10)
    expect(page).to not_have_content('')
    expect(page).to not_have_content('')

    within '.thing-1' do
      expect(page).to have_content(thing_1.name)
      expect(page).to have_content(thing_1.address)
      expect(page).to have_content(thing_1.fuel_types)
      expect(page).to have_content(thing_1.distance)
      expect(page).to have_content(thing_1.access_times)
    end
  end
end
#
# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
