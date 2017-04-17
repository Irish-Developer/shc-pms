class DoctorDecorator < Draper::Decorator
  # using the Draper Gem this Decorator model was created 
  # Decorator is a Ruby on Rails Design Pattern
  delegate_all
  
  # This decorator is used to combine the doctors first and last name to 
  # create a full name attribute 
  def full_name
    
      "#{ object.fname } #{ object.lname }"
    
  end
  
end