describe "Drag and Drop", :drop do
  before(:each) do
    visit "/drag_and_drop"
  end

  it "homem aranha pertence ao time do stark" do
    cap = find(".team-cap .column")         # início
    stark = find(".team-stark .column")     # alvo
    spiderman = find("img[alt$=Aranha]")    # img que quero enviar

    spiderman.drag_to stark                 # ação de arrastar

    expect(stark).to have_css "img[alt$=Aranha]" # confere se a imagem está no stark
    expect(cap).not_to have_css "img[alt$=Aranha]" # confere se o container está vazio
  end
end
