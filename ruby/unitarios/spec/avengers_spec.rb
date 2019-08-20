class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

# hp = AvengersHeadQuarter.new
# teste = hp.put("Spiderman")
# puts teste

describe AvengersHeadQuarter do
  it "deve adicionar um vingador" do
    hp = AvengersHeadQuarter.new
    lista = hp.put("Spiderman")
    expect(lista).to eql ["Spiderman"]
  end
end
