FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password" }
    encrypted_password { "password" }
  end
end
