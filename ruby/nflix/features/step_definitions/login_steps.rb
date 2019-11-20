Quando("eu faço login com {string} e {string}") do |email, senha|
  visit "/"
  find("#emailId").set email
  find("#passId").set senha
  click_button "Entrar"
end

Então("devo ser autenticado") do
  sleep 2
  js_script = 'return window.localStorage.getItem("default_auth_token");'
  token = page.execute_script(js_script)
  expect(token.length).to be 147
end

Então("devo ver {string} na área logada") do |expect_name|
  sleep 2
  user = find(".sidebar-wrapper .user .info span") #passando as classes e a tag para pesquisar o texto
  expect(user.text).to eql expect_name

  # expect(page).to have_text expect_name este pesquisar o texto na página inteira
end

Então("não devo ser autenticado") do
  js_script = 'return window.localStorage.getItem("default_auth_token");'
  token = page.execute_script(js_script)
  expect(token.length).to be nil
end

Então("devo ver a mensagem de alerta {string}") do |expect_message|
  alert = find('.alert')
  expect(alert.text).to eql expect_message
end
