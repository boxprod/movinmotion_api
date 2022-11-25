class MovinmotionApi::CheckProjectName
  def initialize(name:)
    @url = 'https://app.movinmotion.com/project4/apicheckprojectname'
    @company_id = MovinmotionApi::Configuration.default.company_id
    @name_to_check = name
  end

  def call
    payload = { "companyId": @company_id, "projectName": @name_to_check }
    response = MovinmotionApi::ApiService.new(verb: 'post', url: @url, payload: payload).call
  end
end

