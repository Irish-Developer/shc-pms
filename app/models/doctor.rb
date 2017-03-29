class Doctor < ApplicationRecord
  # before_save { email.downcase! }                             #sets the user’s email address to a lower-case version of its current value using the downcase string method
  validates :lname, presence: true, length: {maximum: 20}
  validates :fname, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  #regular expression (or regex), which is a powerful (and often cryptic) language for matching patterns in strings
  validates :email, presence: true, length: {maximum: 243},
  format: { with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
end
