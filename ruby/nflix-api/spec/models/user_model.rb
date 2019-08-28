class UserModel
  attr_accessor :fullname, :email, :password

  def to_hash
    {
      fullname: @fullname,
      email: @email,
      password: @password,
    }
  end
end
