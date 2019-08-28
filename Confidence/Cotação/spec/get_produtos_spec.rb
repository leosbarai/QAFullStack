describe "get", :produto do
  context "buscar cotações da moeda operacional cartão" do
    let(:moeda_op) { build(:produtoCartao_cidade) }
    let(:result) { ApiCotacao.busca_produto_cidade(moeda_op.tipo, moeda_op.cidade) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response[0]["tipo"]).to eql "Cartao" }
    it { expect(result.parsed_response[0]["moeda"]["codigo_iso"]).to eql "USD" }
    it { expect(result.parsed_response[0]["moeda"]["nome"]).to eql "Dólar" }
    it { expect(result.parsed_response[0]["moeda"]["simbolo"]).to eql "US$" }
    it { expect(result.parsed_response[0]["cidade"]["id"]).to eql 952 }
    it { expect(result.parsed_response[0]["cidade"]["nome"]).to eql "Campinas" }
    it { expect(result.parsed_response[0]["cidade"]["estado"]).to eql "SP" }
    it { expect(result.parsed_response[0]["cidade"]["regional_id"]).to eql 64 }
  end

  context "buscar cotações da moeda operacional espécie" do
    let(:moeda_op) { build(:produtoEspecie_cidade) }
    let(:result) { ApiCotacao.busca_produto_cidade(moeda_op.tipo, moeda_op.cidade) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response[0]["tipo"]).to eql "Especie" }
    it { expect(result.parsed_response[0]["moeda"]["codigo_iso"]).to eql "USD" }
    it { expect(result.parsed_response[0]["moeda"]["nome"]).to eql "Dólar" }
    it { expect(result.parsed_response[0]["moeda"]["simbolo"]).to eql "US$" }
    it { expect(result.parsed_response[0]["cidade"]["id"]).to eql 952 }
    it { expect(result.parsed_response[0]["cidade"]["nome"]).to eql "Campinas" }
    it { expect(result.parsed_response[0]["cidade"]["estado"]).to eql "SP" }
    it { expect(result.parsed_response[0]["cidade"]["regional_id"]).to eql 64 }
  end
end
