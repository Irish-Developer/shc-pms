Doctor.create!(fname:  "Youcef", lname: "O'Connor",
            email: "youcefoconnor@gmail.com",
            password:              "123-Dohrayme",
            password_confirmation: "123-Dohrayme",admin: true)
             
99.times do |n|
  fname  = Faker::Name.name
  lname  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Doctor.create!(fname:  fname, lname: lname,
              email: email,
              password:              password,
              password_confirmation: password)
end


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
