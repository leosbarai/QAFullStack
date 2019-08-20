# Ruby é uma linguagem considerada puramente orientada a objetos porque tudo é objeto

class Carro
  attr_accessor :nome

  def Ligar
    puts "O carro está pronto para iniciar o trajeto."
  end
end

civic = Carro.new
civic.Ligar
civic.nome = "Civic"

puts civic.class
puts civic.nome
