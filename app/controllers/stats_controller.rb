class StatsController < ApplicationController
    before_action :find_patient
    
    
  def new
    @stat = Stat.new
  end
  
  def create
    @stat = Stat.new(stat_params)
    @stat.patient_id = @patient.id
    @stat.doctor_id = current_doctor.id
    
    if @stat.save
      redirect_to patient_path(@patient)
    else 
      render 'new'
    end
    
  end
  
  def edit
  end
  
  def update
    if @stat.update(stat_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end
  
  def destroy
    @stat.destroy
    redirect_to patient_path(@patient)
  end
  
  private
 
  def stat_params
    params.require(:stat).permit(:comment)
  end
  def find_patient
    @patient = Patient.find(params[:patient_id])
  end
  
  def find_stat
    @stat = Stat.find(params[:id])
  end
  
end

