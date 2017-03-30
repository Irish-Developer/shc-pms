module SessionsHelper
  
  def log_in(doctor) #logs in the doctor
    session[:doctor_id] = doctor.id
  end
  
  def current_doctor
    @current_doctor ||= Doctor.find_by(id: session[:doctor_id]) # Returns the current logged-in doctor
  end
  
  def logged_in?
    !current_doctor.nil?    #Returns true if a doctor is logged in, false otherwise
  end
  
  def log_out #logs out the doctor
    session.delete(:doctor_id)
    @current_doctor = nil
  end
  
end
