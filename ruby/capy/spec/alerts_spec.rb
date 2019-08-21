describe "Alertas de JS", :alerts do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/javascript_alerts"
  end

  it "alerta" do
    click_button "Alerta"
    msg = page.driver.browser.switch_to.alert.text # troca da página para o alerta e pega o texto
    expect(msg).to eql "Isto é uma mensagem de alerta"
  end

  it "sim confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.accept # para aceitar a mensagem de alerta
    expect(page).to have_content "Mensagem confirmada"
  end

  it "não confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.dismiss # para não aceitar a mensagem de alerta
    expect(page).to have_content "Mensagem não confirmada"
  end

  it "prompt" do
    accept_prompt(with: "Leonardo") do # aceita o prompt com o conteúdo Leonardo quando clicar no botão Prompt
      click_button "Prompt"
    end

    expect(page).to have_content "Olá, Leonardo"
  end

  it "nega prompt", :negacao do
    dismiss_prompt() do # aceita o prompt com o conteúdo Leonardo quando clicar no botão Prompt
      click_button "Prompt"
    end

    expect(page).to have_content "Olá, null"
  end
end
