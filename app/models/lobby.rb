class Lobby < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :game, presence: true
  validates :name, presence: true, uniqueness: true
end
