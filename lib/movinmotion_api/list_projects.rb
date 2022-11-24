class MovinmotionApi::ListProjects
  def initialize
    @url = "https://app.movinmotion.com/projects4/apilistprojects"
    @company_id = MovinmotionApi::Configuration.default.cookie.split('companyId=').last.split('&').first.to_i
  end

  def call
    payload = { "companyId": @company_id }
    response = MovinmotionApi::ApiService.new(verb: 'post', url: @url, payload: payload).call
  end
end
