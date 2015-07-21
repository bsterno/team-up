class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :sport
  has_many :players, dependent: :destroy

  validates :user, presence: true
  validates :description, length: { maximum: 50 }
  validates :sport, presence: true
  validates :street_address, presence: true
  validates :start_date, presence: true
  validates :max_players, presence: true,
    numericality: { only_integer: true }

  include PgSearch
  pg_search_scope :search,
    :against => :street_address,
    :using => {
      :tsearch => { :prefix => true }
    }

  def full?
    if players.count == max_players
      "Full"
    else
      "#{players.count} / #{max_players}"
    end
  end
end
