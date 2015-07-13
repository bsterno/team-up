class Game < ActiveRecord::Base
  belongs_to :user
  has_many :players, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validates :sport, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :start_date, presence: true
  validates :max_players, presence: true, numericality: { only_integer: true }
end
