require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  def setup
    @doctor = Doctor.new(fname: "Example", lname: "Doctor", email: "user@example.com")
  end
  test "should be valid" do
    assert @doctor.valid?
  end
  test "lname should be present" do
    @doctor.lname = "     "
    assert_not @doctor.valid?
  end
  test "fname should be present" do
    @doctor.fname = "     "
    assert_not @doctor.valid?
  end
  test "email should be present" do
    @doctor.email = "     "
    assert_not @doctor.valid?
  end
  test "first name should not be too long" do
    @doctor.fname = "a" * 22
    assert_not @doctor.valid?
  end
  test "last name should not be too long" do
    @doctor.lname = "a" * 22
    assert_not @doctor.valid?
  end
  test "email should not be too long" do
    @doctor.email = "a" * 244 + "@example.com"
    assert_not @doctor.valid?
  end
end
