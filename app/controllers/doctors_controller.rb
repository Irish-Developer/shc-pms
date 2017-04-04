class DoctorsController < ApplicationController
  before_action :logged_in_doctor, only: [:edit, :update]
  before_action :correct_doctor,   only: [:edit, :update]
  
  #display doctor info
  def show
    @doctor = Doctor.find(params[:id])
  end
  def new
    @doctor = Doctor.new
  end
  
  #create account or register
  def create
    doctor = Doctor.find_by(email: params[:session][:email].downcase)
    if doctor && doctor.authenticate(params[:session][:password])
      log_in doctor
      params[:session][:remember_me] == '1' ? remember(doctor) : forget(doctor)
      redirect_back_or doctor
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end      
    
  end
  
  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      flash[:success] = "Profile is updated"
      redirect_to @doctor
    else
      render 'edit'
    end
  end
  
  def edit #Recall that the id of the doctor is available in the params[:id] variable
    @doctor = Doctor.find(params[:id])
  end
  
  private
    def doctor_params
      params.require(:doctor).permit(:fname, :lname, :email, :password, :password_confirmation)
    end
    
    # Confirms a logged-in user.
    def logged_in_doctor
      unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms that the current user is a doctor.
    def correct_doctor
      @doctor = Doctor.find(params[:id])
      redirect_to(root_url) unless current_doctor?(@doctor)
    end
end
    