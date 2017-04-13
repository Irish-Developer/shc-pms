class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  
  def index
      if params[:clinic].blank?                                 #If no clinic is selected 
      @appointments = Appointment.all.order("created_at DESC")  #then show all patients in order of time created
    else
      @clinic_id = Clinic.find_by(name: params[:clinic]).id                      #find the name of condition using its id
      @appointments = Appointment.where(:clinic_id => @clinic_id).order("created_at DESC")
      end
  end
  
  def show 
  end
  
  def new
    @appointment = current_doctor.appointments.build
    #this create an array that store patient conition in order to be displayed in dropdown option
    @clinics = Clinic.all.map{ |c| [c.name, c.id]} 
    @conditions = Condition.all.map{ |c| [c.name, c.id]} 
  end
  
  def create
    @appointment = current_doctor.appointments.build(appointment_params)
    @appointment.clinic_id = params[:clinic_id]
    @appointment.condition_id = params[:condition_id]
    
    if @appointment.save
      flash[:success] = "Appointment created Successfully"
      redirect_to appointments_url
    else
      render 'new'
    end 
  end
  
  def edit
     @clinics = Clinic.all.map{ |c| [c.name, c.id]}
     @conditions = Condition.all.map{ |c| [c.name, c.id]}
  end
  
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
  
  def destroy
    @appointment.destroy
    flash[:success] = "Appointment has been deleted"
    redirect_to appointments_url
  end

  
  private
  
    def appointment_params
      params.require(:appointment).permit(:time, :date, :condition_id, :patient_id, :doctor_id, :clinic_id)
    end
    
    def find_patient
      @appointment = Appointment.find(params[:id])
    end
  
end
