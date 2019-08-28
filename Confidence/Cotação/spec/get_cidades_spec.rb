describe "get" do
  context "buscar cidades", :cidades do
    let(:cidades) { build(:cidades) }
    let(:result) { ApiCotacao.busca_cidades(cidades.cidade, cidades.limite) }

    it { expect(result.response.code).to eql "200" }
    it { expect((result.parsed_response[0]["id"])).to eql 952 }
    it { expect(result.parsed_response[0]["nome"]).to eql "Campinas" }
    it { expect(result.parsed_response[0]["estado"]).to eql "SP" }
    it { expect(result.parsed_response[0]["regional_id"]).to eql 64 }
  end
end
