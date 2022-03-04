require 'rails_helper'

RSpec.describe BackgroundFacade do
  describe '::background' do
    it 'returns a background image url based on the location' do
      image = BackgroundFacade.image("Denver")
      expect(image).to be_a String
    end
  end
end
