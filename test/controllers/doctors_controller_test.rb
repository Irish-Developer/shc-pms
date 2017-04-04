require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @doctor = doctors(:youcef)
    @other_doctor = doctor(:archer)
  end

end
