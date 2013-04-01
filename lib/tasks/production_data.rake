namespace :db do
  desc "Add admin user to db"
  task add_admin: :environment do
    ecm = User.create!(name: "Connor Mendenhall",
                            email: "ecm@pielab.info",
                            password: "changethis",
                            password_confirmation: "changethis")
    ecm.toggle!(:admin)
  end
end
