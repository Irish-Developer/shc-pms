class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic
  belongs_to :condition
end
