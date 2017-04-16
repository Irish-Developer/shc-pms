class Doctor < ApplicationRecord
  has_many :patients
  has_many :appointments
  has_many :stats
  
  
  
  before_save { email.downcase! }                                         #sets the user’s email address to a lower-case version of its current value using the downcase string method
  validates :lname, presence: true, length: {maximum: 50}
  validates :fname, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  #regular expression (or regex), which is a powerful (and often cryptic) language for matching patterns in strings
  validates :email, presence: true, length: {maximum: 243},
  format: { with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  #digest method used to secure passwords being entered over a RESTful web service
  def Doctor.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.search(query)
    where("email like ?", "%#{query}%") 
  end
end
