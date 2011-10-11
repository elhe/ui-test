class DataProvider

  User = Struct.new(:email, :password)

  def self.exist_user
    User.new("ezha.apple@gmail.com", "123456")
  end

  def self.unexist_user
    User.new("#{rand_string}@example.com", "123456")
  end


  def self.rand_string
	(0...50).map{ ('a'..'z').to_a[rand(26)] }.join
  end

end