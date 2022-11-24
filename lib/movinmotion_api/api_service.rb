require 'net/http'

class MovinmotionApi::ApiService
  # cattr_accessor :movinmotion_cookie

  def initialize(attr)
    @url = attr[:path] ? URI("https://app.movinmotion.com#{attr[:path]}") : URI(attr[:url])
    @payload = attr[:payload]
    @verb = attr[:verb]
  end

  def call
    https = Net::HTTP.new(@url.host, @url.port)
    https.use_ssl = true

    p 'api call!'
    response = https.request(request)
    if response && response.is_a?(Net::HTTPOK)
      data = JSON.parse(response.read_body)
      result = OpenStruct.new(success?: true, data: data)
    else
      result = OpenStruct.new(success?: false, result: response)
    end
    result
  end

  private

  def request
    request = "Net::HTTP::#{@verb.camelcase}".constantize.new(@url)
    request["Cookie"] = MovinmotionApi::Configuration.default.cookie
    request.body = @payload.to_json if @payload
    request
  end
end
