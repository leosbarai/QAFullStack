require_relative "models/cidades_model"

FactoryBot.define do
  factory :cidades, class: CidadesModel do
    cidade { "Campinas" }
    limite { "1" }
  end
end
