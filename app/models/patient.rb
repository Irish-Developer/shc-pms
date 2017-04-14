class Patient < ApplicationRecord
  belongs_to :doctor
  belongs_to :condition
  has_many :stats
  has_many :appointments
  has_many :clinics, through: :appointments
end
