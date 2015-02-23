class User < ActiveRecord::Base
  has_secure_password

  has_many :blogs
  has_many :posts, through: :blogs

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(pass)
    @password = BCrypt::Password.create(pass)
    self.password_digest = @password
  end

end