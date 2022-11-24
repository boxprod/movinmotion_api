namespace :movinmotion_api do
  desc "Movinmotion API setup"
  task :install do
    rails generate mm_initializer
  end
end
