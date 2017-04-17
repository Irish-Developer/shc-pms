class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  
  def index
  # Search function (I could not get this to work)
      @appointments = if params[:clinic]
       Appointment.where('name LIKE ?', "%#{params[:clinic]}%")
       else
         @appointments = Appointment.all.order("created_at DESC")
       end 
       
  #If no clinic is selected
  #then show all patients in order of time created
      if params[:clinic].blank?                                                               
      @appointments = Appointment.all.order("created_at DESC")                                
    else
  #find the id of the selected clinic and dispalay all of condition using its id
  #appointments for that clinic
      @clinic_id = Clinic.find_by(name: params[:clinic]).id                                    
      @appointments = Appointment.where(:clinic_id => @clinic_id).order("created_at DESC")     
      end
  end
  
  def show 
  end
  
  # making a new appointment
  def new
    @appointment = current_doctor.appointments.build                                          
  #this create an array that store patient conition in order to be displayed in dropdown option
    @clinics = Clinic.all.map{ |c| [c.name, c.id]} 
    @conditions = Condition.all.map{ |c| [c.name, c.id]} 
  end
  
  # create a new appointment
  def create
    @appointment = current_doctor.appointments.build(appointment_params)
    @appointment.clinic_id = params[:clinic_id]
    @appointment.condition_id = params[:condition_id]
    
  # store appointment
    if @appointment.save
      flash[:success] = "Appointment created Successfully"
      redirect_to appointments_url
    else
      render 'new'
    end 
  end
  
  # change appointment details
  def edit
  # store clinics in a temporay map
     @clinics = Clinic.all.map{ |c| [c.name, c.id]}
  # store condition types in a temporay map
     @conditions = Condition.all.map{ |c| [c.name, c.id]}
  end
  
  # update the database with the editted details
  def update
    @appointment.clinic_id = params[:clinic_id]
    @appointment.condition_id = params[:condition_id]
    if @appointment.update(appointment_params)
      flash[:success] = "Appointment has been updated"
      redirect_to appointment_path(@appointment)
    else
      render 'edit'
    end
  end
  
  # delete appointment
  def destroy
    @appointment.destroy
    flash[:success] = "Appointment has been deleted"
    redirect_to appointments_url
  end

  
  private
  
  # set paramaters to appointments dtatbase
  def appointment_params
    params.require(:appointment).permit(:time, :date, :condition_id, :patient_id, :doctor_id, :clinic_id, :msg, :p_email)
  end
  
  # find appointment by using its param id
  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
  
end
