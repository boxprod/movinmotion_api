class MovinmotionApi::WorkerInfo
  def initialize(email:)
    @path = '/project4/apicheckworker'
    @email = email
  end

  def call
    payload = {
      projectId: 5566759051460608,
      workerMail: @email
    }

    response = MovinmotionApi::ApiService.new(verb: 'post', path: @path, payload: payload).call
    if response.success? && response.data.dig('content', 'found')
      OpenStruct.new(response.data.dig('content', 'infos'))
    else
      nil
    end
  end
end
