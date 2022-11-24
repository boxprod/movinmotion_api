MovinmotionApi.configure do |mm|
      mm.cookie = ENV['MOVINMOTION_COOKIE']
      mm.use_classes = true
    end
    