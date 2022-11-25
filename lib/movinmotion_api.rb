require "movinmotion_api/version"
require "movinmotion_api/railtie"
require "movinmotion_api/workers"
require "movinmotion_api/worker_info"
require "movinmotion_api/list_positions"
require "movinmotion_api/list_ccns"
require "movinmotion_api/list_projects"
require "movinmotion_api/get_ccn_position"
require "movinmotion_api/check_project_name"
require "movinmotion_api/write_project"
require "movinmotion_api/api_service"
require "movinmotion_api/configuration"
require "app/models/mm"
require "app/models/mm_position"
require "app/models/mm_ccn"
require "app/models/mm_project"

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

  def self.list_projects
    ListProjects.new.call
  end

  def self.get_ccn_position(id:, idcc_number:)
    GetCcnPosition.new(id: id, idcc_number: idcc_number).call
  end

  def self.check_project_name(name:)
    CheckProjectName.new(name: name).call
  end

  def self.write_project(name:, idcc_number:, type_code:)
    WriteProject.new(name: name, idcc_number: idcc_number, type_code: type_code).call
  end
end
