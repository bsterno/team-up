require 'rails_helper'

RSpec.describe Game do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name) }
  it { should validate_presence_of(:sport) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:start_date) }
  it { should validate_numericality_of(:max_players) }
end
