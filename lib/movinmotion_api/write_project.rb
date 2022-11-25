class MovinmotionApi::WriteProject
  def initialize(name:, idcc_number:, type_code:)
    @url = 'https://app.movinmotion.com/projects4/apiwriteproject'
    @idcc_number = idcc_number
    @type_code = type_code
    @company_id = MovinmotionApi::Configuration.default.company_id
    @name = name
  end

  def call
    payload = {
      "companyId": @company_id,
      "name": @name,
      "typeCode": @type_code,
      "idccNumber": @idcc_number
    }
    response = MovinmotionApi::ApiService.new(verb: 'post', url: @url, payload: payload).call
  end
end

# {"idccNumber":"2642","typeCode":1,"name":"test!","companyId":5662903521771520}
