require "movinmotion_api/version"
require "movinmotion_api/railtie"
require_relative "movinmotion_api/workers"
require_relative "movinmotion_api/worker_info"
require_relative "movinmotion_api/list_positions"
require_relative "movinmotion_api/list_ccns"
require_relative "movinmotion_api/get_ccn_position"
require_relative "movinmotion_api/api_service"
require_relative "movinmotion_api/configuration"

module MovinmotionApi
  def self.configure
    return Configuration.default unless block_given?

    yield(Configuration.default)
    Configuration.default
  end

  def self.workers(search = nil)
    # search doesnt work
    Workers.new(search: search).call
  end

  def self.worker_info(email:)
    WorkerInfo.new(email: email).call
  end

  def self.list_ccns
    ListCcns.new.call
  end

  def self.list_positions
    ListPositions.new.call
  end
end
