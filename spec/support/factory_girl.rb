require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "user #{n}ame" }
    password 'password'
    password_confirmation 'password'
  end

  factory :game do
    user
    sequence(:description) { |n| "Shot Practice! #{n}" }
    sport
    street_address "123 Road"
    start_date "2015-07-13 21:00:00 UTC"
    max_players "10"
  end

  factory :sport do
    sequence(:name) { |n| "Soccer #{n}" }
  end

  factory :player do
    user
    game
  end

  factory :state do
    sequence(:abbr) { |n| "AK #{n}" }
    sequence(:name) { |n| "Alaska #{n}" }
  end
end
