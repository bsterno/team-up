require 'rails_helper'

RSpec.describe Player do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:game) }
  it { should validate_presence_of(:game) }
end
