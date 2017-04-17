module SessionsHelper
  
  def log_in(doctor) #logs in the doctor (starts session)
    session[:doctor_id] = doctor.id
  end
  
  # Remembers the doctor in a session
  def remember(doctor)
    doctor.remember
    cookies.permanent.signed[:doctor_id] = doctor.id
    cookies.permanent[:remember_token] = doctor.remember_token
  end
  
  # Gives a true if the given doctor is already logged in
  def current_doctor?(doctor)
    doctor == current_doctor
  end
  
  # Returns the current logged-in doctor
  def current_doctor
    @current_doctor ||= Doctor.find_by(id: session[:doctor_id]) 
  end
  
  #Returns true if a doctor is logged in, false otherwise
  def logged_in?
    !current_doctor.nil?    
  end
  
  #logs out the doctor
  def log_out 
    # cancel session
    session.delete(:doctor_id)
    @current_doctor = nil
  end
  
  # Takes non-logged-in doctors to home page
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Temporary stores the URL being opened by the doctor
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end
