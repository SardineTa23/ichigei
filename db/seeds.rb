# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ユーザー
10.times do |n|
  name  = "User#{n+1}"
  email = "example-#{n+1}@careerWalk.com"
  password = "password"
  user = User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
  title = "Post#{n+1}"
  content = "Post-content#{n+1}"
  url = "Post-url#{n+1}"
  5.times do |e|
    user.posts.create!(title: title, content: content, url: url)
  end
end


#カテゴリー
Category.create([
    { name: 'ruby' },
    { name: 'ruby_on_rails4' },
    { name: 'ruby_on_Rails5' },
    { name: 'python2' },
    { name: 'python3' },
    { name: 'django2' }
  ])