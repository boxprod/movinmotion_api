class MmJob < Mm
  def self.categories
    all.map(&:cmb_position_category).uniq
  end

  def details(ccn:)
    response = MovinmotionApi.get_ccn_position(id: id, idcc_number: ccn.idcc_number)
    OpenStruct.new(response.dig('data', 'content', 'ccnPosition')) if response&.success?
  end

  def ccns
    idcc_numbers.map{MmCcn.find_by(idcc_number: _1)}
  end
end
