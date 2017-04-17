class Doctor < ApplicationRecord
  has_many :patients
  has_many :appointments
  has_many :stats
  # associations with patients, appointments and stats tables
  
  #sets the user’s email address to a lower-case version of its current value using the downcase string method
  before_save { email.downcase! }    
  # maximum letters for first and last name are 50 each
  validates :lname, presence: true, length: {maximum: 50}
  validates :fname, presence: true, length: {maximum: 50}
  
  #regular expression (or regex), which is a powerful (and often cryptic) language for matching patterns in strings
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  
  # maximum letters for email name are 243
  validates :email, presence: true, length: {maximum: 243},
  format: { with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}

  # password is secure and has a minimum of 6 characters
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  #digest (encryption) method used to secure passwords being entered over a RESTful web service
  def Doctor.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.search(query)
    where("email like ?", "%#{query}%") 
  end
end
