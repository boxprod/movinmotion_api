class MovinmotionApi::ListCcns
  def initialize
    @path = '/reference/apilistccns'
    @verb = 'get'
  end

  def call
    response = MovinmotionApi::ApiService.new(verb: @verb, path: @path).call
    # if response.success?
    #   ccn_list = OpenStruct.new
    #   ccn_list.data = response.data.dig('content', 'ccns').map do |ccn|
    #     OpenStruct.new(ccn)
    #   end
    # else
    #   nil
    # end
  end
end
