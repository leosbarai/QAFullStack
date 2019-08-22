describe "iframes" do
  describe "bom", :nice do
    before(:each) do
      visit "/nice_iframe"
    end

    it "adicionar ao carrinho" do
      within_frame("burgerId") do
        produto = find(".menu-item-info-box", text: "REFRIGERANTE")
        produto.find("a").click
        expect(find("#cart")).to have_content "R$ 4,50"
      end
    end
  end

  describe "ruim", :bad_iframe do # quando o iframe não tem ID
    before(:each) do
      visit "/bad_iframe"
    end

    it "deve estar vazio" do
      script = '$(".box-iframe").attr("id", "tempId");' # cria um script adicionando um ID temporário para o iframe
      page.execute_script(script) # executa o script para criar o ID antes da execução do teste

      within_frame("tempId") do # passa o id temporário para localizar
        expect(find("#cart")).to have_content "Seu carrinho está vazio!"
      end
    end
  end
end
