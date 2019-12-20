# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar')

User.create!(name: 'User 1',
             email: 'user-1@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar')

Post.create!(content: 'First post for the first user',
             user_id: 1)

Post.create!(content: 'First post for the second user',
             user_id: 2)
