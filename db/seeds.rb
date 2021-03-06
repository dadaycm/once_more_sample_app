User.delete_all()

User.create!(name:  "dadaycm",
             email: "dadaycm@hotmail.com",
             password:              "00000000",
             password_confirmation: "00000000",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "914319825",
            email: "914319825@qq.com",
            password:              "00000000",
            password_confirmation: "00000000",
            admin:     true,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  # content = Faker::Hipster.sentences(1)
  # content = Faker::ChuckNorris.fact
  users.each { |user| user.microposts.create!(content: content) }
end
