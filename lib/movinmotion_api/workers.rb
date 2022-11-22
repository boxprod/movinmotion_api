class MovinmotionApi::Workers
  def initialize(attr)
    @search = attr[:search]
    @url = "https://back.app.movinmotion.com/api/core/v1/companies/5662903521771520/workers"
  end

  def call
    payload = {"pagination":{"currentIndex":1,"pageSize":200,"startIndex":0},"filtering":{"inactive":false,"positionNames":[],"privateActive":false,"publicActive":false,"searchName":@search || "","tagNames":[],"uninvited":false}}
    response = MovinmotionApi::ApiService.new(verb: 'post', url: @url, payload: payload).call
  end
end




# response = MovinmotionApi::ApiService.new(verb: @verb, path: @path).call
#     if response.success?
#       response.data.dig('content', 'ccns').map do |ccn|
#         OpenStruct.new(ccn)
#       end
#     else
#       nil
#     end
