class ApiCotacao
  include HTTParty
  base_uri "https://api.tihum.com/cotacao/api"
  headers "Content-Type" => "application/json"

  def self.busca_cidades(cidade, limite)
    get("/v1/cidades?cidade=#{cidade}&limite=#{limite}")
  end

  def self.busca_moedas_operacionais(tipo)
    get("/v1/moedas-operacionais?tipo=#{tipo}")
  end

  def self.busca_moedas_operacionais_rem(pais_id)
    get("/v1/moedas-operacionais?tipo=Remessa&pais_id=#{pais_id}")
  end
end
