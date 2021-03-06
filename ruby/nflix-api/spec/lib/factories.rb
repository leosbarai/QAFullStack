require "faker"
require_relative "../models/user_model"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Leonardo Sbarai" }
    email { "leonardo.sbarai@dextra-sw.com" }
    password { "123456" }

    # depois que buildar e criar a massa de teste, pega os dados do usuário para usar no comando delete
    after(:build) do |user|
      Database.new.delete_user(user.email)
    end
  end

  factory :registered_user do
    id { 0 }
    full_name { Faker::Movies::Starwars.character } # preenche com nome dos personagens do star wars
    email { Faker::Internet.free_email(full_name) } # gera um email com base no nome do personagem
    password { "123456" }

    after(:build) do |user|
      Database.new.delete_user(user.email)
      result = ApiUser.save(user.to_hash)
      user.id = result.parsed_response["id"] #retorna o id do usuário ao gravar o usuário
    end
  end

  factory :user_wrong_email, class: UserModel do
    full_name { "Leonardo Sbarai" }
    email { "leonardo.sbaraidextra-sw.com" }
    password { "123456" }
  end

  factory :empty_name_user do
    full_name { "" }
    email { "leonardo.sbaraidextra-sw.com" }
    password { "123456" }
  end

  factory :empty_email_user do
    full_name { "Leonardo Sbarai" }
    email { "" }
    password { "123456" }
  end

  factory :empty_password_user do
    full_name { "Leonardo Sbarai" }
    email { "leonardo.sbaraidextra-sw.com" }
    password { "" }
  end
end
