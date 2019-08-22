describe "Forms" do
  it "login com sucesso" do
    visit "/login"

    fill_in "userId", with: "stark"     #escrever no campo usando a tag id
    fill_in "password", with: "jarvis!" #escrever no campo usando a tag name

    click_button "Login"

    expect(find("#flash").visible?).to be true #visible retorna um booleano se o elemento está visível

    # valida se o texto do campo é exatamente igual à msg de texto
    # expect(find("#flash").text).to eql "Olá, Tony Stark. Você acessou a área logada!"

    # valida se o texto do campo está incluso na mensagem de texto
    # expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"

    # verifica se no conteúdo contém o texto da mensagem
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "senha incorreta" do
    visit "/login"

    fill_in "userId", with: "stark"
    fill_in "password", with: "jarvis"

    click_button "Login"

    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "Senha é invalida!"
  end

  it "usuário não cadastrado" do
    visit "/login"

    fill_in "userId", with: "tony"
    fill_in "password", with: "jarvis"

    click_button "Login"

    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!"
  end
end
