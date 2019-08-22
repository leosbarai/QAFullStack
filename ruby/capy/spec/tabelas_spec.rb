describe "Tabelas", :tabs do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/tables"
  end

  it "deve exibir o salário do stark" do
    # tr = find("table tbody tr") # hierarquia das tags da tabela, porém o find só retorna um elemento

    atores = all("table tbody tr") # all retorna todos os elementos do tr

    # tipo um foreach, vai percorrer todos os elementos e retornar a linha inteira da tabela
    # quando encontrar o texto informado
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }

    expect(stark.text).to include "10.000.000" # passa o conteúdo para o expect e valida a linha correta
  end

  it "deve exibir o salário do vin diesel" do
    # busca exatamente a linha do vin diesel
    diesel = find("table tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "10.000.000"
  end

  it "deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")

    movie = diesel.all("td")[2].text # cria um array com os TDs e retorna o texto da posição [2]

    expect(movie).to eql "Velozes e Furiosos" # valida se o texto retornado é igual
  end

  it "deve exibir o insta do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text

    expect(insta).to eql "@teamcevans"
  end

  it "deve selecionar Chris Prat para remoção" do
    prat = find("table tbody tr", text: "Chris Prat")
    prat.find("a", text: "delete").click # clicar no link 'a'

    msg = page.driver.browser.switch_to.alert.text # altera o foco para a mensagem e retorna o texto

    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "deve selecionar Chris Prat para edição" do
    prat = find("table tbody tr", text: "Chris Prat")
    prat.find("a", text: "edit").click # clicar no link 'a'

    msg = page.driver.browser.switch_to.alert.text # altera o foco para a mensagem e retorna o texto

    expect(msg).to eql "Chris Pratt foi selecionado para edição!"
  end
end
