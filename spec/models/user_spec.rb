require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }

  describe 'admin?' do
    context 'user is admin' do
      it 'should return true' do
        admin = FactoryGirl.create(:user, role: 'admin')
        expect(admin.role).to eq('admin')
      end
    end

    context 'user is admin' do
      it 'should return false' do
        user = FactoryGirl.create(:user)
        expect(user.role). to eq('user')
      end
    end
  end
end
