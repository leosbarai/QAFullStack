describe "get", :moeda_op do
  context "consultas relacionadas a moeda operacional" do
    let(:cartao) { build(:moeda_operacional_cartao) }
    let(:result) { ApiCotacao.busca_moedas_operacionais(cartao.tipo) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response[0]["tipo"]).to eql "Cartao" }
  end

  context "garantir cotação espécie" do
    let(:especie) { build(:moeda_operacional_especie) }
    let(:result) { ApiCotacao.busca_moedas_operacionais(especie.tipo) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response[0]["tipo"]).to eql "Especie" }
  end

  context "garantir cotação remessa" do
    let(:pais) { build(:pais_moeda_operacional) }
    let(:result) { ApiCotacao.busca_moedas_operacionais_rem(pais.pais_id) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response[0]["tipo"]).to eql "Remessa" }
  end
end
