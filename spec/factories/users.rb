FactoryBot.define do
  factory :user_a, class: User do
    email { "user_a@example.com" }
    name { "user_a" }
    display_name { "user_a" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :user_b, class: User do
    email { "user_b@example.com" }
    name { "user_b" }
    display_name { "user_b" }
    password { "password" }
    password_confirmation { "password" }
  end
end