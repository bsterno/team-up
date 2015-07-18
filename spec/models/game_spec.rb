require 'rails_helper'

RSpec.describe Game do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should validate_length_of(:description) }
  it { should validate_presence_of(:sport) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:start_date) }
  it { should validate_numericality_of(:max_players) }

  describe 'searching' do
    it 'matches by city' do
      3.times { FactoryGirl.create(:game) }

      results = Game.search(Game.last.street_address)
      expect(results).to include(Game.last)
    end

    it 'matches by partial name' do
      3.times { FactoryGirl.create(:game) }

      results = Game.search(Game.last.street_address[0..3])
      expect(results).to include(Game.last)
    end
  end
end
