class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

describe AvengersHeadQuarter do
  it "deve adicionar um vingador" do
    hp = AvengersHeadQuarter.new
    hp.put("Spiderman")

    expect(hp.list).to eql ["Spiderman"] #se é igual ao retorno da lista
  end

  it "deve adicionar uma lista de vingadores" do
    hp = AvengersHeadQuarter.new
    hp.put("Thor")
    hp.put("Hulk")
    hp.put("Spiderman")

    res = hp.list.size > 0
    expect(res).to be true            # verifica se o resultado é verdadeiro, no caso a lista é verdadeira
    expect(hp.list.size).to be > 0    # verifica se a lista é maior que zero, só funciona para listas
    expect(hp.list).to include "Thor" # se existe a string na lista
  end

  it "thor deve ser o primeiro da lista" do
    hp = AvengersHeadQuarter.new
    hp.put("Thor")
    hp.put("Hulk")
    hp.put("Spiderman")

    expect(hp.list).to start_with("Thor") # verifica se o Thor é o primeiro da lista
  end

  it "ironman deve ser o último da lista" do
    hp = AvengersHeadQuarter.new
    hp.put("Thor")
    hp.put("Hulk")
    hp.put("Spiderman")
    hp.put("Ironman")

    expect(hp.list).to end_with("Ironman") # verifica se o Ironman é o último da lista
  end

  it "deve conter o sobrenome" do
    avenger = "Peter Parker"

    expect(avenger).to match(/Parker/) # Se contém o valor
    expect(avenger).not_to match(/John/) # Se não contém o valor
  end
end
