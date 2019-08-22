describe "Alternando janelas", :wnd do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/windows"
  end

  it "nova janela" do
    nova_janela = window_opened_by { click_link "Clique aqui" } # abre a nova guia no navegador
    # click_link "Clique aqui" # tag <a> do HTML é sempre link

    within_window -> { page.title == "Nova Janela" } do
      expect(page).to have_content 'Aqui temos uma nova janela \o/'
    end

    nova_janela.close # fecha a nova janela do navegador
    expect(nova_janela.closed?).to be true
  end
end
