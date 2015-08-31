class Stat < ActiveRecord::Base
  def self.sports
    games = Game.all
    sports = []
    games.each do |game|
      sports << game.sport
    end

    sports.to_a.map!(&:serializable_hash)
    array = []
    sports.each do |sport|
      array << sport["name"]
    end

    @@sport_count = Hash.new(0)
    array.each{|key| @@sport_count[key] += 1}
    @@sport_count
  end
end
