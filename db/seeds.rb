# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all()
Comment.destroy_all()
User.destroy_all()



PASSWORD = "123"
test_user = User.create(
  name: "Gabriel",
  email: "gabriel@example.com",
  password: PASSWORD,
  admin: false,
)
admin = User.create(
  name: "admin",
  email: "admin@admin.com",
  password: PASSWORD,
  admin: true,
)

10.times do
  name = Faker::Name.first_name
  User.create(

    name: name,
    email: "#{name}@gmail.com",
    password: PASSWORD,
    admin: false,
  )
end

users = User.all

50.times do
  title = Faker::Hipster.sentence
  body = Faker::Hipster.paragraph_by_chars(characters: 256, supplemental: false)
  p = Post.create(
    title: title,
    body: body,
    user: users.sample,
  )
  if p.valid?
    p.comments = rand(1..10).times.map do
      Comment.new(
        body: Faker::Hipster.paragraph,
        user: users.sample,
      )
    end
  end
end

puts Cowsay.say("Created 50 posts!", :frogs)