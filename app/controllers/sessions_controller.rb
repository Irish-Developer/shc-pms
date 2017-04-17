class SessionsController < ApplicationController
  
  def new
  end

  # Create a session for the logged in doctor
  def create
    doctor = Doctor.find_by(email: params[:session][:email].downcase)
    # if doctors logged in details authenticate then take the doctor to his/her profile
    if doctor && doctor.authenticate(params[:session][:password]) #checks to see if the doctor is valid- && is a logical AND
      log_in doctor
      redirect_to doctor
    else
      # if authentiction failed then take the user back to logged in page
      # and display invalid detail message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Cancel the session once the doctor signs out
  def destroy
    log_out
    redirect_to root_url
  end

end
