class CidadesModel
  attr_accessor :cidade, :limite

  def to_hash
    {
      cidade: @cidade,
      limite: @limite,
    }
  end
end
