User.delete_all()

User.create!(name:  "dadaycm",
             email: "dadaycm@hotmail.com",
             password:              "Adam2015",
             password_confirmation: "Adam2015",
             admin: true)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
