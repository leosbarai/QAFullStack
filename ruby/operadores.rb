numero1 = 0
numero2 = 0
total = 0

puts 'Entre com o número 1: '
numero1 = gets.chomp.to_i

puts 'Entre com o número 2: '
numero2 = gets.chomp.to_i

total = numero1 + numero2
puts 'Total: ' + total.to_s

# operadores de compração
# maior que >
# maior igual que >=
# menor igual que <=
# menor que <
# diferente !=
# igual a ==
# igual eql?

v1 = 10
v2 = 10
puts v1 > v2
puts v1.eql?(v2)