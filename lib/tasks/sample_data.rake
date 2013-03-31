namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    beatrice = User.create!(name: "Beatrice Fastwater",
                            email: "bzf@pielab.info",
                            password: "beatrice",
                            password_confirmation: "beatrice")
    beatrice.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@pielab.info"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    10.times do
        title = Faker::Lorem.sentence(5)
        content = Faker::Lorem.paragraph(4)
        users.each { |user| user.posts.create!(title: title,
                                               content: content) }
    end
  end
end
