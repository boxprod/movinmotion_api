class MovinmotionApi::Configuration

  attr_accessor :cookie

  def self.default
    @@default ||= new
  end

  def self.reset
    @@default = nil
  end

  def use_classes=(boolean)
    return unless boolean

    MmJob.setup { MovinmotionApi.list_positions.data.dig('content', 'positions') }
    MmCcn.setup { MovinmotionApi.list_ccns.data.dig('content', 'ccns') }
  end
end
