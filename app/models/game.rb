class Game < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validates :sport, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :start_date, presence: true
  validates :max_players, numericality: { only_integer: true }
end
