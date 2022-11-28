module Mm
  class Project < OrmLookAlike
    def self.create!(name:, type_code:, ccn:)
      response = MovinmotionApi.write_project(name: name, type_code: type_code, idcc_number: ccn.idcc_number)
      return unless response.success?

      new_project_id = response.data.dig('content', 'projectId')
    end
  end
end
