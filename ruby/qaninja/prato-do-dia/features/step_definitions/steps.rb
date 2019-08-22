module Enjoeat
  def prato_do_dia(dia)
    if dia == "segunda-feira"
      "Virado a Paulista"
    elsif dia == "terça-feira"
      "Dobradinha"
    end
  end
end

World Enjoeat # expõe os métodos do módulo

Dado("que hoje é segunda-feira") do
  @hoje = "segunda-feira"
end

Dado("que hoje é terça-feira") do
  @hoje = "terça-feira"
end

Quando("eu pergunto qual é o prato do dia") do
  @resposta_obtida = prato_do_dia(@hoje)
end

Então("a resposta deve ser {string}") do |resposta_esperada|
  expect(@resposta_obtida).to eql resposta_esperada
end
