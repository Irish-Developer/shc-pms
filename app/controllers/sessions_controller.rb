class SessionsController < ApplicationController
  
  def new
  end

  def create
    doctor = Doctor.find_by(email: params[:session][:email].downcase)
    if doctor && doctor.authenticate(params[:session][:password]) #checks to see if the doctor is valid- && is a logical and
      log_in doctor
      redirect_to doctor
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
