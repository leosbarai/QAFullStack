require_relative "models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Leonardo Sbarai" }
    email { "leonardo.sbarai@dextra-sw.com" }
    password { "123456" }
  end
end
