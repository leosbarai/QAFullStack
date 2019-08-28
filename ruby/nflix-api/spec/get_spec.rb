describe "get" do
  let(:user) { build(:registered_user) }
  let(:token) { ApiUser.token(user.email, user.password) }
  let(:result) { ApiUser.find(token, user.id) }
  let(:user_data) { Database.new.find_user(user.email) }

  it { expect(result.response.code).to eql "200" }
  it { expect(result.parsed_response["full_name"]).to eql user_data["full_name"] }
  it { expect(result.parsed_response["password"]).to eql user_data["password"] }
  it { expect(result.parsed_response["email"]).to eql user_data["email"] }
  # o nome do campo da API é diferente do banco de dados, se atentar nisso! Além de converter o formato para data para não haver divergências
  it { expect(Time.parse(result.parsed_response["createdAt"])).to eql Time.parse(user_data["created_at"]) }
  it { expect(Time.parse(result.parsed_response["updateAt"])).to eql Time.parse(user_data["update_at"]) }
end
