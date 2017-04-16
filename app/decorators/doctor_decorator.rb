class DoctorDecorator < Draper::Decorator
  delegate_all
  
  def full_name
    
      "#{ object.fname } #{ object.lname }"
    
  end
  
end