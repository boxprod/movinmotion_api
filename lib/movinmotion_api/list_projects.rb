class MovinmotionApi::ListProjects
  def initialize
    @url = "https://app.movinmotion.com/projects4/apilistprojects"
  end

  def call
    payload = { "companyId": 5662903521771520 }
    response = MovinmotionApi::ApiService.new(verb: 'post', url: @url, payload: payload).call
  end
end
