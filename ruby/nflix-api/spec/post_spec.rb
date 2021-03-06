describe "post" do
  context "when new user" do
    # before do
    #   @new_user = build(:user).to_hash # build a factory chamada :user já convertendo pra hash
    #   result = ApiUser.save(@new_user)
    # end

    # let pode substituir o método before
    # let só é executado quando é chamado dentro da expectativa
    # diferente do before que é sempre executado primeiro
    let(:result) { ApiUser.save(build(:user).to_hash) }  # :result recebe o retorno do método ApiUser.save

    it { expect(result.response.code).to eql "200" }
  end

  context "when duplicate email" do
    let(:result) { ApiUser.save(build(:registered_user).to_hash) }

    it { expect(result.response.code).to eql "409" }
    it { expect(result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email adress." }
  end

  context "when wrong email" do
    let(:result) { ApiUser.save(build(:user_wrong_email).to_hash) }

    it { expect(result.response.code).to eql "412" }
    # o parsed_response já pega a mensagem no formato hash de chave : valor para validar a msg de erro
    it { expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
  end

  context "when empty name" do
    let(:result) { ApiUser.save(build(:empty_name_user).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
  end

  context "when empty email" do
    let(:result) { ApiUser.save(build(:empty_email_user).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
  end

  context "when empty password" do
    let(:result) { ApiUser.save(build(:empty_password_user).to_hash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
  end
end
