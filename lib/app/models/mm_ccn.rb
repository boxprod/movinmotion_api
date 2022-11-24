class MmCcn < Mm
  # def self.setup
  #   ccns_yaml = File.join(Rails.root, 'storage', 'mm_ccns.yml')
  #   unless File.exist? ccns_yaml
  #     File.open(ccns_yaml, 'w') do |file|
  #       file.write(YAML.dump(MovinmotionApi.list_positions.data.dig('content', 'positions')))
  #     end
  #   end
  #   @@mm_ccns = YAML.safe_load(File.open(File.join(Rails.root, 'storage', 'mm_ccns.yml')).read).map{OpenStruct.new(_1)}
  # end

  # def self.all
  #   @@mm_ccns
  # end

  # def self.first
  #   @@mm_ccns.first
  # end

  # def self.find(id)
  #   @@mm_ccns.select{_1.id == id}.first
  # end

  # def self.count
  #   @@mm_ccns.count
  # end

  # def self.where(condition)
  #   message = condition.first.first
  #   value = condition.first.last
  #   @@mm_ccns.select do |job|
  #     column = job.send(message.to_s)
  #     next unless column

  #     if column.is_a?(Array)
  #       raise "Value should be of class #{column.first.class} for column #{message}" if column.first.class != value.class

  #       column.include? value
  #     else
  #       raise "Value should be of class #{column.class} for column #{message}" if column.class != value.class

  #       column == value
  #     end
  #   end
  # end
end
