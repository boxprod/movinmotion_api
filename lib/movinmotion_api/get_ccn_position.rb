class MovinmotionApi::GetCcnPosition
  def initialize(position:)
    @path = '/reference/apigetccnposition'
    @payload = {
      idccNumber: position.ccn.idcc_number,
      positionId: position.movinmotion_id
    }
  end

  def call
    response = MovinmotionApi::ApiService.new(verb: 'post', path: @path, payload: @payload).call
  end
end
