require 'rails_helper'

RSpec.describe Lobby do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:game) }
  it { should validate_presence_of(:name) }
end
