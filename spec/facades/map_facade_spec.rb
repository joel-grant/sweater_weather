require 'rails_helper'

RSpec.describe MapFacade do
  describe '::directions' do
    it 'returns the details for a trip between two locations' do
      start = "Denver, Co"
      stop = "Pueblo, Co"
      data = MapFacade.directions(start, stop)

      expect(data).to be_a Hash
    end
  end
end
