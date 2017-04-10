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