describe "post" do
  context "when new user" do
    before do
      @new_user = build(:user) # build a factory chamada :user       #=>  massa utilizada anteriormente { full_name: "Leonardo Sbarai", email: "leonardo.sbarai@dextra-sw.com", password: "jedi123" }
      Database.new.delete_user(@new_user[:email])

      @result = HTTParty.post(
        "http://192.168.99.100:3001/user",
        body: @new_user.to_json,
        headers: {
          "Content-Type" => "application/json",
        },
      )
    end

    # retorna a mesma mensagem, porém, em inglês
    it { expect(@result.response.code).to eql "200" }

    # it "então deve retornar 200" do
    #   expect(@result.response.code).to eql "200"
    # end
  end
end

# describe "cadastro" do
#   it "novo usuário" do
#     # chama o script para deletar a massa de testes
#     Database.new.delete_user("eu@papito.io")

#     # testar o método POST informando o ENDPOINT, o body e headers conforme documentação da API
#     result = HTTParty.post(
#       "http://192.168.99.100:3001/user",
#       body: { full_name: "Fernando Papito", email: "eu@papito.io", password: "123456" }.to_json, #convertendo para o formato JSON
#       headers: {
#         "Content-Type" => "application/json",
#       },
#     )
#     # exibe o retorno da mensagem da API
#     puts result
#     # confere se o retorno da API é 200
#     expect(result.response.code).to eql "200"
#   end
# end
