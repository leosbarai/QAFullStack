describe "get" do
  context "buscar moedas operacionais cadastradas" do
    before do
      @result = HTTParty.get(
        "https://api.tihum.com/cotacao/api/v1/moedas-operacionais"
      )
    end

    it { expect(@result.response.code).to eql "404" }
  end
end
