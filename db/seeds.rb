# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create!(id: 1, name: 'Java', priority: 1)
Category.create!(id: 2, name: 'Ruby', priority: 2)
Category.create!(id: 3, name: 'C/C++', priority: 3)
Category.create!(id: 4, name: 'Python', priority: 4)
Category.create!(id: 5, name: 'Assembly', priority: 5)

15.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password)
end

users = User.order(:created_at).take(15)

5.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.articles.create!(title: title, text: content, category_id: 1) }
end

5.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.articles.create!(title: title, text: content, category_id: 2) }
end

5.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.articles.create!(title: title, text: content, category_id: 3) }
end

5.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.articles.create!(title: title, text: content, category_id: 4) }
end

5.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.articles.create!(title: title, text: content, category_id: 5) }
end
