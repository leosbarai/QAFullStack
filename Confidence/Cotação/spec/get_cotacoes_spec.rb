describe "get" do
  context "garantir cotação" do
    before do
      @result = HTTParty.get(
        "https://api.tihum.com/cotacao/api/v1/cotacoes"
      )
    end

    it { expect(@result.response.code).to eql "500" }
  end
end
