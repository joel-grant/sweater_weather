require 'rails_helper'

RSpec.describe BackgroundService do
  describe '::get_image' do
    it 'returns an image based on the name of the location' do
      data = BackgroundService.get_image("Denver")

      expect(data).to have_key(:photos)
      expect(data[:photos]).to be_an Array
      # require 'pry'; binding.pry
      expect(data[:photos][0]).to have_key(:url)
      expect(data[:photos][0]).to have_key(:photographer)
    end
  end
end
