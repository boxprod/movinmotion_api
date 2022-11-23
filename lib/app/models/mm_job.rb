class MmJob
  def self.setup
    jobs_yaml = File.join(Rails.root, 'storage', 'jobs.yml')
    unless File.exist? jobs_yaml
      File.open(jobs_yaml, 'w') do |file|
        file.write(YAML.dump(MovinmotionApi.list_positions.data.dig('content', 'positions')))
      end
    end
    @@mm_jobs = YAML.safe_load(File.open(File.join(Rails.root, 'storage', 'jobs.yml')).read).map{OpenStruct.new(_1)}
  end

  def self.all
    @@mm_jobs
  end

  def self.first
    @@mm_jobs.first
  end

  def self.find(id)
    @@mm_jobs.select{_1.id == id}
  end

  def self.count
    @@mm_jobs.count
  end

  def self.where(condition)
    message = condition.first.first
    value = condition.first.last
    @@mm_jobs.select do |job|
      column = job.send(message.to_s)
      next unless column

      if column.is_a?(Array)
        raise "Value should be of class #{column.first.class} for column #{message}" if column.first.class != value.class

        column.include? value
      else
        raise "Value should be of class #{column.class} for column #{message}" if column.class != value.class

        column == value
      end
    end
  end

  def self.categories
    @@mm_jobs.map(&:cmbPositionCategory).uniq
  end
end
