class MmJob < Mm
  def self.categories
    all.map(&:cmbPositionCategory).uniq
  end

  def details(ccn:)
    MovinmotionApi.get_ccn_position(id: id, idcc_number: ccn.idccNumber)
  end

  def ccns
    p 'coucou'
    idccNumbers.map{MmCcn.find_by(idccNumber: _1)}
  end
end
