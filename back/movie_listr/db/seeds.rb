# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rating.destroy_all
Movie.destroy_all
User.destroy_all

Movie.create!([
    {title: "Fight Club", omdbid: "tt0137523"},
    {title: "Lady Bird", omdbid: "tt4925292"}
])

User.create!([
    {username: "ccrane"},
    {username: "johntest"}
])

Rating.create([
    {rating: "4", movie_id: 1, user_id: 1}
])