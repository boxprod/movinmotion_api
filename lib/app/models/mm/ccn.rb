module Mm
  class Ccn < OrmLookAlike
    def positions
      MmPosition.where(idcc_numbers: idcc_number)
    end

    def positions_by_crew
      positions.group_by(&:crew_name).transform_values { _1.sort_by(&:name) }
    end

    def positions_names_by_crew
      positions.group_by(&:crew_name).transform_values { _1.map(&:name).sort }
    end
  end
end
