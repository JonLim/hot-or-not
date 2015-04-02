# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

userPath = "#{Rails.root}/db/randomusers.json"
users = JSON.parse(File.read(userPath))

users["results"].each do |user|
  Person.create(name: user["user"]["name"]["first"].capitalize, imageurl: user["user"]["picture"]["large"], times_liked: 0, times_rated: 0)
end