class MmJob < Mm
  def self.categories
    all.map(&:cmbPositionCategory).uniq
  end
end
