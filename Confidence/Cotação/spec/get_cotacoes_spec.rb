describe "get", :moeda_op do
  context "garantir cotação cartão" do
    let(:cartao) { build(:moeda_operacional_cartao) }
    let(:result) { ApiUser.busca_moedas_operacionais(cartao.tipo) }

    it { expect(result.response.code).to eql "200" }
  end

  context "garantir cotação espécie" do
    let(:especie) { build(:moeda_operacional_especie) }
    let(:result) { ApiUser.busca_moedas_operacionais(especie.tipo) }

    it { expect(result.response.code).to eql "200" }
  end

  context "garantir cotação remessa" do
    let(:pais) { build(:pais_moeda_operacional) }
    let(:result) { ApiUser.busca_moedas_operacionais_rem(pais.pais_id) }

    it { expect(result.response.code).to eql "200" }
  end
end
