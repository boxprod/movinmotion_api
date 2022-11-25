MovinmotionApi.configure do |mm|
  cookie_file = File.join(Rails.root, 'storage', 'movinmotion_cookie.txt')
  mm.cookie = File.open(cookie_file).read.strip
  mm.use_classes = true
  mm.write_access = false
end
