class DoctorsController < ApplicationController
  
  #display doctor info
  def show
    @doctor = Doctor.find(params[:id])
  end
  def new
    @doctor = Doctor.new
  end
  
  #create account or register
  def create
    @doctor = Doctor.new(user_params)    
    if @doctor.save
      log_in @doctor
      flash[:success] = "Welcome Doctor!"
      redirect_to @doctor #redirecting to the newly created user’s profile
      
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:doctor).permit(:fname, :lname, :email, :password,
                                   :password_confirmation)
    end
end
