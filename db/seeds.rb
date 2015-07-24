# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "jonnybliss@gmail.com", name: "jb", password: "testtest")
User.create!(email: "philipauu@gmail.com", name: "philower", password: "testtest")
User.create!(email: "zani.d@gmail.com", name: "trix", password: "testtest")
User.create!(email: "k3v.stern@gmail.com", name: "meefl", password: "testtest")
User.create!(email: "taha@gmail.com", name: "taha", password: "testtest")

sport_list = [
  'American Football',
  'Badminton',
  'Baseball',
  'Basketball',
  'Bowling',
  'Cricket',
  'Field Hockey',
  'Golf',
  'Ice Hockey',
  'Lacrosse',
  'Paintball',
  'Rugby',
  'Soccer',
  'Table Tennis',
  'Tennis',
  'Ultimate Frisbee',
  'Volleyball'
]

sport_list.each do |sport|
  Sport.create!(name: sport)
end

# state_list = [
#   ['Alabama', 'AL'],
#   ['Alaska', 'AK'],
#   ['Arizona', 'AZ'],
#   ['Arkansas', 'AR'],
#   ['California', 'CA'],
#   ['Colorado', 'CO'],
#   ['Connecticut', 'CT'],
#   ['Delaware', 'DE'],
#   ['District of Columbia', 'DC'],
#   ['Florida', 'FL'],
#   ['Georgia', 'GA'],
#   ['Hawaii', 'HI'],
#   ['Idaho', 'ID'],
#   ['Illinois', 'IL'],
#   ['Indiana', 'IN'],
#   ['Iowa', 'IA'],
#   ['Kansas', 'KS'],
#   ['Kentucky', 'KY'],
#   ['Louisiana', 'LA'],
#   ['Maine', 'ME'],
#   ['Maryland', 'MD'],
#   ['Massachusetts', 'MA'],
#   ['Michigan', 'MI'],
#   ['Minnesota', 'MN'],
#   ['Mississippi', 'MS'],
#   ['Missouri', 'MO'],
#   ['Montana', 'MT'],
#   ['Nebraska', 'NE'],
#   ['Nevada', 'NV'],
#   ['New Hampshire', 'NH'],
#   ['New Jersey', 'NJ'],
#   ['New Mexico', 'NM'],
#   ['New York', 'NY'],
#   ['North Carolina', 'NC'],
#   ['North Dakota', 'ND'],
#   ['Ohio', 'OH'],
#   ['Oklahoma', 'OK'],
#   ['Oregon', 'OR'],
#   ['Pennsylvania', 'PA'],
#   ['Puerto Rico', 'PR'],
#   ['Rhode Island', 'RI'],
#   ['South Carolina', 'SC'],
#   ['South Dakota', 'SD'],
#   ['Tennessee', 'TN'],
#   ['Texas', 'TX'],
#   ['Utah', 'UT'],
#   ['Vermont', 'VT'],
#   ['Virginia', 'VA'],
#   ['Washington', 'WA'],
#   ['West Virginia', 'WV'],
#   ['Wisconsin', 'WI'],
#   ['Wyoming', 'WY']
# ]
#
# state_list.each do |state|
#   State.create!(abbr: state[1], name: state[0])
# end
