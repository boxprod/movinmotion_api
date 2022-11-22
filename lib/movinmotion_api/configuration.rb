class MovinmotionApi::Configuration

  attr_accessor :cookie

  def self.default
    @@default ||= new
  end
end
