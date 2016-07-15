class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!

  include BCrypt

  has_many :tweets

  validates :usuario , presence: true , confirmation: true
  # validates :mail , presence: true , confirmation: true
  # validates :password , presence: true , confirmation: true
  validates :usuario, uniqueness: true
  # validates :mail, uniqueness: true

 
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(mail: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end  
  end  

end
