describe "Teclado", :key do
  before(:each) do
    visit "/key_presses"
  end

  it "enviando teclas" do
    # find("#campo-id").send_keys :space # simulando a tecla espaço
    # expect(page).to have_content "You entered: SPACE"

    teclas = %i[tab escape space enter shift control alt] # %i para criar um array de símbolos

    teclas.each do |t|
      find("#campo-id").send_keys t
      expect(page).to have_content "You entered: " + t.to_s.upcase
      sleep 1
    end
  end

  it "enviando letras" do
    letras = %w[a s d f g h j k l] # %w para criar um array de letras

    letras.each do |l|
      find("#campo-id").send_keys l
      expect(page).to have_content "You entered: " + l.to_s.upcase
      sleep 1
    end
  end
end
