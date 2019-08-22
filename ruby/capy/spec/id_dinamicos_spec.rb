describe "IDs Dinamicos", :ids_dinamicos do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end

  # Para IDs dinâmicos, o ideal é trabalhar com regex para utilizar o trecho imutável da tag
  it "cadastro" do
    find("input[id$=UsernameInput]").set "Leonardo" # $ termina com
    find("input[id^=PasswordInput]").set "123456"   # ^ começa com

    find("a[id*=GetStartedButton]").click       # * contém valor

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
