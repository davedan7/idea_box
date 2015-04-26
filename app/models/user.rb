class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :ideas

  enum role: %w(default admin)

  def admin?
    role == 'admin'
  end
  
end
