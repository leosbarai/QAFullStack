class Conta
  attr_accessor :saldo, :nome

  def initialize(nome) #construtor
    self.saldo = 0.0
    self.nome = nome
  end

  def deposita(valor)
    self.saldo += valor
    puts "Depositando a quantia de #{valor} reais na conta de #{self.nome}." #interpolação de String (converte automaticamente para String)
  end
end

c = Conta.new("Leonardo")
c.deposita(100.00)
puts c.saldo

c.deposita(10.00)
puts c.saldo
