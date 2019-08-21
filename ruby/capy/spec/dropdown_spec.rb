describe "Caixa de seleção", :dropdown do # :dropdown é a tag para o método
  it "item específico simples" do
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"

    # select('Opção', from: 'elemento') para selecionar uma das opções do dropdown do tipo select através do id do elemento
    select("Loki", from: "dropdown")
    sleep 3
  end

  it "item especifico com o find" do
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"

    drop = find(".avenger-list") #buscando pela classe do dropdown
    drop.find("option", text: "Scott Lang").select_option
    sleep 3
  end

  it "qualquer item", :samples do #tag para o método
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"

    drop = find(".avenger-list")

    # buscando todos dos elementos da tag <option> e retorna um elemento aleatório (.sample)
    drop.all("option").sample.select_option
    sleep 3
  end
end
