describe "Login 3", :login3 do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end

  it "login com sucesso" do
    # login_form = find("#login") # atribui o formulário
    # login_form.find("input[name=username]").set "stark"   # procura o elemento somente dentro do formulário
    # login_form.find("input[name=password]").set "jarvis!"
    # click_button "Entrar"

    # outra forma de limitar o escopo de pesquisa dos elementos
    within("#login") do
      find("input[name=username]").set "stark"
      find("input[name=password]").set "jarvis!"
      click_button "Entrar"
    end

    expect(find("#flash").visible?).to be true
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "cadastro com sucesso" do
    within("#signup") do
      find("input[name=username]").set "Leonardo"
      find("input[name=password]").set "123456!"
      click_link "Criar Conta"
    end

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
