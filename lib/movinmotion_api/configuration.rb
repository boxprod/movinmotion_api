class MovinmotionApi::Configuration

  attr_reader :cookie, :company_id
  attr_accessor :write_access

  def self.default
    @default ||= new
  end

  def self.reset
    @default = nil
  end

  def cookie=(cookie)
    @cookie = cookie
    @company_id = cookie.split('companyId=').last.split('&').first.to_i
  end

  def use_classes=(boolean)
    return unless boolean

    MmPosition.setup { MovinmotionApi.list_positions.data.dig('content', 'positions') }
    MmCcn.setup { MovinmotionApi.list_ccns.data.dig('content', 'ccns') }
    MmProject.setup { MovinmotionApi.list_projects.data.dig('content', 'projects') }
  end
end
