require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the welcome page' do
    it 'I can get directions to the nearest charging station' do
      visit '/'

      select 'Turing', from: :location
      click_on 'Find Nearest Station'

      expect(current_path).to eq('/search')

      name = find('.name').text
      expect(name).not_to be_empty

      address = find('.address').text
      expect(address).not_to be_empty

      fuel_type = find('.fuel_type').text
      expect(fuel_type).not_to be_empty

      access_times = find('.access_times').text
      expect(access_times).not_to be_empty

      expect(page).to have_content('Distance: 0.1 miles')
      expect(page).to have_content('Travel Time: 1 min')
      expect(page).to have_content('Directions: Turn left onto Lawrence St Destination will be on the left')
    end
  end
end
