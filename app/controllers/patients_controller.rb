class PatientsController < ApplicationController
  
  def pat_index
  end
  
  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new(patient_params)
    
    if @patient.save
      flash[:success] = "Patient Added Successfully"
      redirect_to patients_url
    else
      render 'new'
    end 
  end
  
  private
  
    def patient_params
      params.require(:patient).permit(:name, :dob, :address1, :address2, :phone)
    end
  
end
