class ApiUser
  include HTTParty
  base_uri "https://api.tihum.com/cotacao/api"
  headers "Content-Type" => "application/json"

  def self.busca_cidades(cidade, limite)
    get("/v1/cidades?cidade=#{cidade}&limite=#{limite}")
  end
end
