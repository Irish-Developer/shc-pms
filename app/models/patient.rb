class Patient < ApplicationRecord
  belongs_to :doctor
  belongs_to :condition
  has_many :stats
  has_many :appointments
  has_many :clinics, through: :appointments
  # associations with other tables/models
  
  # search quary
  def self.search(query)
    where("email like ?", "%#{query}%") 
  end
end
