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
    @doctor = Doctor.new(doctor_params)    
    if @doctor.save
      log_in @doctor
      flash[:success] = "Welcome Doctor!"
      redirect_to @doctor #redirecting to the newly created user’s profile
      
    else
      render 'new'
    end
  end
  
  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  
  def edit #Recall that the id of the doctor is available in the params[:id] variable
    @doctor = Doctor.find(params[:id])
  end
  
  private
    def doctor_params
      params.require(:doctor).permit(:fname, :lname, :email, :password,
                                   :password_confirmation)
    end
end