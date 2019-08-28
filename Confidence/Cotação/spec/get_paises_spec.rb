describe "get" do
  context "buscar países" do
    before do
      @result = HTTParty.get(
        "https://api.tihum.com/cotacao/api/v1/paises"
      )
    end

    it { expect(@result.response.code).to eql "200" }
  end
end
