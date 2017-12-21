# Here is the login details for admin, this user can delete doctors
Doctor.create!(fname:  "Youcef", lname: "O'Connor",
            email: "youcefoconnor@gmail.com",
            password:              "123-Dohrayme",
            password_confirmation: "123-Dohrayme",admin: true)

#Here is were fake or mock data is nerated for 99 doctors 
99.times do |n|
  fname  = Faker::Name.name
  lname  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Doctor.create!(fname:  fname, lname: lname, email: email,
              password: password, password_confirmation: password)
end

# #  prefixed patient condition types --------------------------
Condition.create!(name:"Dislocated Joint")
Condition.create!(name:"Brain injury")
Condition.create!(name:"Cancer-related")
Condition.create!(name:"Cancer-related Intensive Care")
Condition.create!(name:"Cold symptoms")
Condition.create!(name:"Comfortable")
Condition.create!(name:"Criticle but stable")
Condition.create!(name:"Deceased")
Condition.create!(name:"Discharged")
Condition.create!(name:"Fever")
Condition.create!(name:"Flu symptoms")
Condition.create!(name:"Foriegn body")
Condition.create!(name:"Fracture")
Condition.create!(name:"Healthy")
Condition.create!(name:"Heart Failer")
Condition.create!(name:"Ligiment Damage")
Condition.create!(name:"Progressing well")
Condition.create!(name:"Respiratory Failure")
Condition.create!(name:"Ruptured Brain Anurysm")
Condition.create!(name:"Satisfactory")
Condition.create!(name:"Sepsis")
Condition.create!(name:"Sexual Transmitted Infection")
Condition.create!(name:"Shock")
Condition.create!(name:"Stable")
Condition.create!(name:"Stress")
Condition.create!(name:"Trauma")
Condition.create!(name:"Unconsious")

# Prefixed Clinic names and address's-----------------------------------------------------------------
Clinic.create!(name:"Sacret Heart", address:"29 Downing Street, Cork", email:"x13114557@student.ncirl.ie")
Clinic.create!(name:"Beaumont Hospital", address:"Beumount, Whitehall, Dublin 09", email:"x13114557@student.ncirl.ie")
Clinic.create!(name:"Mater Hospital", address:"Dorset Street, Dublin 01", email:"x13114557@student.ncirl.ie")
Clinic.create!(name:"Ballymun HSE Clinic", address:"Ballymun Road, Dublin 11", email: "example@nci.com")
Clinic.create!(name:"Sims Fertility Clinic", address:"Cork", email: "example@nci.com")
Clinic.create!(name:"Smithfield Clinic ", address:"Smithfield Square, Dublin 02", email: "example@nci.com")
Clinic.create!(name:"Dame Street Medical Centre ", address:"Dame Street, Dublin 01", email: "example@nci.com")
Clinic.create!(name:"Sports Surgery Clinic ", address:"Northwood Avenue, Santry, Dublin 09", email: "example@nci.com")
Clinic.create!(name:"Ballsgrove Health Centre ", address:"Ballsgrove, Drogheda, Co.Louth", email: "example@nci.com")
Clinic.create!(name:"Tobin Healthcare ", address:"Castlebar, Co.Mayo", email: "example@nci.com")
Clinic.create!(name:"Sports Clinic West ", address:"Castlebar, Co.Mayo", email: "example@nci.com")
Clinic.create!(name:"Galway Clinic", address:"Doughiska, Galway", email: "example@nci.com")
Clinic.create!(name:"VHI Swiftcare Clinic ", address:"Cobh Cork", email: "example@nci.com")
Clinic.create!(name:"The Cork Clinic ", address:"Cobh Cork", email: "example@nci.com")
Clinic.create!(name:"Faythe Medical Centre ", address:"Wexford", email: "example@nci.com")
Clinic.create!(name:"Blackrock Clinic ", address:"Black Rock Dublin", email: "example@nci.com")
Clinic.create!(name:"VHI Dublin ", address:"Airside Retail Park, Dublin", email: "example@nci.com")
