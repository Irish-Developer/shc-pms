class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = Patient.all.order("created_at DESC")
  end
  
  def show 
  end
  
  def new
    @patient = current_doctor.patients.build
    #this create an array that store patient conition in order to be displayed in dropdown option
    @conditions = Condition.all.map{ |c| [c.name, c.id]} 
  end
  
  def create
    @patient = current_doctor.patients.build(patient_params)
    @patient.condition_id = params[:condition_id]
    
    if @patient.save
      flash[:success] = "Patient Added Successfully"
      redirect_to patients_url
    else
      render 'new'
    end 
  end
  
  def edit
     @conditions = Condition.all.map{ |c| [c.name, c.id]}
  end
  
  def update
    @patient.condition_id = params[:condition_id]
    if @patient.update(patient_params)
      flash[:success] = "Patient profile updated"
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end
  
  def destroy
    @patient.destroy
    flash[:success] = "Patient's profile deleted"
    redirect_to patients_url
  end

  
  private
  
    def patient_params
      params.require(:patient).permit(:name, :dob, :address1, :address2, :phone, :condition_id)
    end
    
    def find_patient
      @patient = Patient.find(params[:id])
    end
  
end