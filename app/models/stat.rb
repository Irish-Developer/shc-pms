class Stat < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  # status has associations with doctor and patient
  
end
