# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..15).each do |i|
  User.create(name: "User#{i}", email: "user#{i}@example.com",
    password: "password", password_confirmation: "password")
end

(1..5).each do |i|
  Admin.create(name: "Admin#{i}", email: "admin#{i}@example.com",
    password: "password", password_confirmation: "password")
end

categories = ["IT", "Sport", "Novel"]
its = ["Rails", "Git", "MySQL"]
sports = ["Badminton", "Volleyball", "Football"]
novels = ["Don Quixote", "Harry Potter", "God Father"]

categories.each do |category|
  Category.create(name: category)
end

its.each do |it|
  Book.create(category_id: 1, title: it, summary: "Summary of #{it}",
    author: "Author", page: 100, 
    published_at: DateTime.now.change(year: 2010)
  )
end

sports.each do |sport|
  Book.create(category_id: 2, title: sport, summary: "Summary of #{sport}",
    author: "Author", page: 200, 
    published_at: DateTime.now.change(year: 2011)
  )
end

novels.each do |novel|
  Book.create(category_id: 1, title: novel, summary: "Summary of #{novel}",
    author: "Author", page: 300, 
    published_at: DateTime.now.change(year: 2012)
  )
end