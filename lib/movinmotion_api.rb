require "movinmotion_api/version"
require "movinmotion_api/railtie"
require "movinmotion_api/workers"
require "movinmotion_api/worker_info"
require "movinmotion_api/list_positions"
require "movinmotion_api/list_ccns"
require "movinmotion_api/get_ccn_position"
require "movinmotion_api/api_service"
require "movinmotion_api/configuration"
require "app/models/mm"
require "app/models/mm_job"
require "app/models/mm_ccn"

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

  def self.get_ccn_position(id:, idcc_number:)
    GetCcnPosition.new(id: id, idcc_number: idcc_number).call
  end
end
