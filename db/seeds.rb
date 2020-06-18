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
               display_name: name,
               password: password,
               password_confirmation: password)
  title = "#{n+1}"
  content = "content#{n+1}"
  url = "url#{n+1}"
  condition = "condition#{n+1}"
  reward = n + 50
  5.times do |e|
    user.posts.create!(title: "Post#{title}", content: "Post#{content}", url: "Post#{url}")
    user.works.create!(title: "Work#{title}", description: "Work#{content}", condition: "Work#{condition}", reward: reward, started_at: Time.zone.now, ended_at: Time.zone.now)
  end
end


#カテゴリー
Category.create([
    { name: 'プログラミング' },
    { name: 'マジック（手品）' },
    { name: 'イラストデザイン' },
    { name: '講演' },
    { name: '法律' },
    { name: '経済' },
    { name: 'お料理' },
    { name: '翻訳（ライティング）' },
    { name: '翻訳(スピーキング）' },
    { name: '運転' },
    { name: '漫才' },
    { name: 'コント' }
  ])