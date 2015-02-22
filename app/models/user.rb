class User < ActiveRecord::Base
  has_many :blogs
  has_many :posts, through: :blogs

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(pass)
    @password = BCrypt::Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
   user = User.find_by_email(email)
    return user if user && (user.password == password)
  end

end