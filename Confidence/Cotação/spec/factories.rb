require_relative "models/cidades_model"
require_relative "models/moeda_operacional_model"
require_relative "models/paises_model"

FactoryBot.define do
  factory :cidades, class: CidadesModel do
    cidade { "Campinas" }
    limite { "1" }
  end

  factory :moeda_operacional_cartao, class: MoedaOperacionalModel do
    tipo { "Cartao" }
  end

  factory :moeda_operacional_especie, class: MoedaOperacionalModel do
    tipo { "Especie" }
  end

  factory :pais_moeda_operacional, class: MoedaOperacionalModel do
    pais_id { 122 }
  end

  factory :pais_id, class: PaisesModel do
    id { 76 }
  end
end
