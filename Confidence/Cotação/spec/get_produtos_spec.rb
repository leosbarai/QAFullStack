describe "get" do
  context "buscar cotações da moeda operacional" do
    before do
      @result = HTTParty.get(
        "https://api.tihum.com/cotacao/api/v1/cidades?cidade=Campinas&limite=10"
      )
    end

    it { expect(@result.response.code).to eql "200" }
  end
end
