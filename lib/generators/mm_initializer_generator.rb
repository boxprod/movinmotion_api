class MmInitializerGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"
  def create_initializer_file
    create_file "config/initializers/movinmotion_api.rb",
    "MovinmotionApi.configure do |mm|
      mm.cookie = ENV['MOVINMOTION_COOKIE']
      mm.use_classes = true
    end
    "
  end
end
