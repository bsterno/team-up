class State < ActiveRecord::Base
  has_many :games

  validates :name, presence: true, uniqueness: true
  validates :abbr, presence: true, uniqueness: true
end
