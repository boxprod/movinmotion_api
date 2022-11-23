class MovinmotionApi::GetCcnPosition
  def initialize(id:, idcc_number:)
    # p position
    @path = '/reference/apigetccnposition'
    @payload = {
      idccNumber: idcc_number,
      positionId: id
    }
  end

  def call
    response = MovinmotionApi::ApiService.new(verb: 'post', path: @path, payload: @payload).call
  end
end
