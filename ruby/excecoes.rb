# begin #try
#   file = File.open("./ola")
#   if file
#     puts file.read
#   else
#   end
# rescue Exception => e #catch
#   puts e.message
#   puts e.backtrace
# end

def soma(n1, n2)
  n1 + n2
rescue Exception => e
  puts "Erro ao executar a soma!"
  puts e.backtrace
end

soma("10", 5)
