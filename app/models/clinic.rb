class Clinic < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :conditions, through: :appointments
end
