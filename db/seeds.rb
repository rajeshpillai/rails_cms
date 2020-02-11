# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
Category.destroy_all
User.destroy_all


admin_user = User.create(email: "admin@cms.xyz",username:"admin",password:"123456",password_confirmation:"123456")

Category.create(title: "Electronics", description:"All about electronics")
Category.create(title: "Books", description:"All about books")
Category.create(title: "Video Tutorials", description:"Video tutorials")
Category.create(title: "Programming", description:"All about programming")
Category.create(title: "Web Development", description:"All about web development")


5.times do |index|
  offset = rand(Category.count)
  category = Category.offset(offset).first
  Post.create(title: "Post " + index.to_s, description: "Post goes here", published: true, category: category, user: admin_user )
end


3.times do |index|
  offset = rand(Category.count)
  category = Category.offset(offset).first
  Post.create(title: "Post " + index.to_s, description: "Post goes here", published: false, category: category, user: admin_user )
end

