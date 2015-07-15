class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :sport
  has_many :players, dependent: :destroy

  validates :user, presence: true
  validates :description, presence: true,
    uniqueness: true,
    length: { maximum: 20}
  validates :sport, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :start_date, presence: true
  validates :max_players, presence: true,
    numericality: { only_integer: true }
end
