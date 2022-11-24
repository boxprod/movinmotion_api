class Mm
  def self.setup
    yaml = File.join(Rails.root, 'storage', "#{name.underscore}s.yml")
    unless File.exist?(yaml) || File.empty?(yaml)
      p 'api call!'
      File.open(yaml, 'w') do |file|
        data = YAML.dump(yield)
        file.write(data) unless data.empty?
      end
    end
    @@all = YAML.safe_load(File.open(File.join(Rails.root, 'storage', "#{name.underscore}s.yml")).read).map{OpenStruct.new(_1)}
  end

  def self.all
    @@all
  end

  def self.first
    @@all.first
  end

  def self.find(id)
    @@all.select{_1.id == id}.first
  end

  def self.count
    @@all.count
  end

  def self.where(condition)
    message = condition.first.first
    value = condition.first.last
    @@all.select do |job|
      column = job.send(message.to_s)
      next unless column

      if column.is_a?(Array)
        raise StandardError, "Value should be of class #{column.first.class} for column #{message}" if column.first.class != value.class

        column.include? value
      else
        raise StandardError, "Value should be of class #{column.class} for column #{message}" if column.class != value.class

        column == value
      end
    end
  end
end
