module SessionsHelper
  
  def log_in(doctor) #logs in the doctor
    session[:doctor_id] = doctor.id
  end
  
  # Remembers a user in a persistent session.
  def remember(doctor)
    doctor.remember
    cookies.permanent.signed[:doctor_id] = doctor.id
    cookies.permanent[:remember_token] = doctor.remember_token
  end
  
  # Returns true if the given user is the current user.
  def current_doctor?(doctor)
    doctor == current_doctor
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
  
  # Redirects non-logged-in user to stored location (or to the default) which will be their profile.
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end
