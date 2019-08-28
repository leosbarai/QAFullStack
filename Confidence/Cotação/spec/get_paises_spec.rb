describe "get", :pais do
  context "buscar moedas por país" do
    let(:pais) { build(:pais_id) }
    let(:result) { ApiCotacao.busca_moedas_do_pais(pais.id) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response[0]["tipo"]).to eql "Remessa" }
    it { expect(result.parsed_response[0]["moeda"]["codigo_iso"]).to eql "USD" }
    it { expect(result.parsed_response[0]["moeda"]["nome"]).to eql "Dólar" }
    it { expect(result.parsed_response[0]["moeda"]["simbolo"]).to eql "US$" }
  end
end
