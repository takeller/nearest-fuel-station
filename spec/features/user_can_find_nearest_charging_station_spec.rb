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

      distance = find('.distance').text
      expect(distance).not_to be_empty

      travel_time = find('.travel_time').text
      expect(travel_time).not_to be_empty

      directions = find('.directions').text
      expect(directions).not_to be_empty
    end
  end
end
