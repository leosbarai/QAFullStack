describe "Upload", :upload do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/upload"

    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt" # pwd retorna o diretório no qual o projeto está sendo executado
    @imagem = Dir.pwd + "/spec/fixtures/imagem.jpg"
  end

  it "upload com arquivo texto" do
    # puts @arquivo # mostra o caminho do arquivo

    attach_file("file-upload", @arquivo)  # passa o identificador do elemento + arquivo que terá o upload
    click_button "Upload"

    # validação para conferir se foi realizado o upload com sucesso
    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo.txt"
  end

  it "upload de imagem", :upload_imagem do
    attach_file("file-upload", @imagem)  # passa o identificador do elemento + arquivo que terá o upload
    click_button "Upload"

    # Como foi configurado no arquivo spec_helper.rb o comando config.default_max_wait_time = 15, vai esperar por 15 segundos até a página carregar
    img = find("#new-image") #pega o elemento da imagem e compara se o nome está igual
    expect(img[:src]).to include "/uploads/imagem.jpg" # o elemento :src foi retirado de dentro da tag img
  end

  after(:each) do
    sleep 2
  end
end
