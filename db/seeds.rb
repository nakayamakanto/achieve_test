# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
    name=Faker::Name.first_name
    email=Faker::Internet.email
    password="password"
    User.create!(name: name, email: email, password: password, password_confirmation: password)
end

100.times do |n|
    title="hoge"+n.to_s
    content="hoge"+n.to_s
    user_id=rand(100)+1
    Blog.create!(title: title, content: content, user_id: user_id)
end
