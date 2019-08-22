describe "Caixas de seleção", :checkbox do
  before(:each) do # sempre será executado antes de cada iteração
    visit "/checkboxes"
  end

  it "marcando uma opção" do
    check("thor") # para marcar uma opção do checkbox
  end

  it "desmarcando uma opção" do
    uncheck("antman") # para desmarcar uma opção já marcada
  end

  it "marcando com find set true" do
    find("input[value = cap]").set(true) # marcando pelo elemento "value" (usado quando não existe id)
  end

  it "desmarcando com find set false" do
    find("input[value=guardians]").set(false) # desmarcando pelo elemento "value"
  end

  after(:each) do # sempre será executado depois das iterações
    sleep 3
  end
end
