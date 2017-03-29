class Doctor < ApplicationRecord
  validates :lname, presence: true, length: {maximum: 20}
  validates :fname, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 243}
end
