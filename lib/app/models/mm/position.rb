module Mm
  class Position < OrmLookAlike
    # include Mm
    def self.categories
      map(&:cmb_position_category).uniq
    end

    def ccn_details(ccn:)
      response = MovinmotionApi.get_ccn_position(id: id, idcc_number: ccn.idcc_number)
      OpenStruct.new(response.dig('data', 'content', 'ccnPosition')&.transform_keys(&:underscore)) if response&.success?
    end

    def ccns
      idcc_numbers.map{MmCcn.find_by(idcc_number: _1)}.compact
    end
  end
end
