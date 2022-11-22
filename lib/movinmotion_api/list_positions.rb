class MovinmotionApi::ListPositions
  def initialize
    @path = '/reference/apilistpositions'
  end

  def call
    response = MovinmotionApi::ApiService.new(verb: 'get', path: @path).call
    if response.success?
      response.data.dig('content', 'positions').map do |position|
        OpenStruct.new(position)
      end
    else
      nil
    end
  end
end
