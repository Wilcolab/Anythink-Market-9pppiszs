# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Load Users
for i in 1..100
    user = User.new(email: "test#{i}@test.com", username: "test#{i}", password: 'password', password_confirmation: 'password')
    user.save unless user.validate != true
end

# Load Products and Comments
for i in 1..100
    item = Item.new(title: "Title#{i}", slug: "Slug#{i}", description: "desc")
    item.user = User.first
    comment = Comment.new(body: "body for item")
    comment.user = User.first
    comment.item = item
    if item.validate 
        item.save
        comment.save
    end
end
