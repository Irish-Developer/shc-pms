class StatsController < ApplicationController
    before_action :find_patient
    
  # new status post
  def new
    @stat = Stat.new
  end
  
  # create patient status post
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
  
  # update status post
  def update
    if @stat.update(stat_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end
  
  # delete status
  def destroy
    @stat.destroy
    redirect_to patient_path(@patient)
  end
  
  private
 
  # set parameters for comment
  def stat_params
    params.require(:stat).permit(:comment)
  end
  # fird patienyt
  def find_patient
    @patient = Patient.find(params[:patient_id])
  end
  
  # find aptients status
  def find_stat
    @stat = Stat.find(params[:id])
  end
  
end

