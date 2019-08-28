class UserModel
  attr_accessor :id, :fullname, :email, :password

  def to_hash
    {
      fullname: @fullname,
      email: @email,
      password: @password,
    }
  end
end
