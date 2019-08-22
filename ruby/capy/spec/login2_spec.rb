describe "Login 2" do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/login2"
  end

  it "com data de nascimento", :login2 do
    find("#userId").set "stark"
    find("#passId").set "jarvis!"

    login_form = find("#login") # guarda os dados do formulário do login

    case login_form.text # um case para quando encontrar cada texto
    when /Dia/
      find("#day").set "29"
    when /Mes/
      find("#month").set "05"
    when /Ano/
      find("#year").set "1970"
    end

    click_button "Login"

    expect(find("#flash").visible?).to be true #visible retorna um booleano se o elemento está visível
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end
end
