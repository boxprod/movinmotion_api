module Mm
  class OrmLookAlike
    extend Enumerable

    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
      attributes.each do |key, value|
        instance_variable_set("@#{key.underscore}", value)
        self.class.send(:attr_reader, key.underscore)
      end
    end

    def self.setup
      yaml = File.join(Rails.root, 'storage', "#{name.underscore}s.yml")
      unless File.exist?(yaml) && !File.open(yaml).read.empty?
        dir = File.join(Rails.root, 'storage', 'mm')
        Dir.mkdir(dir) unless Dir.exist?(dir)
        File.open(yaml, 'w') do |file|
          data = YAML.dump(yield)
          file.write(data) unless data.empty?
        end
      end
      yaml_serialized = File.open(yaml).read
      @all = YAML.safe_load(yaml_serialized).map { new(_1) }
    end

    def self.each
      @all.each { yield _1 }
    end

    def self.all
      @all
    end

    def self.first
      @all.first
    end

    def self.last
      @all.last
    end

    def self.find(id)
      @all.select{_1.id == id}.first
    end

    def self.count
      @all.count
    end

    def self.where(condition)
      message = condition.first.first
      value = condition.first.last
      raise StandardError, "No column '#{message}' for #{name}" unless first.respond_to?(message.to_s)

      @all.select do |el|
        column = el.send(message.to_s)
        next unless column

        if column.is_a?(Array)
          # raise StandardError, "Value should be of class #{column.first.class} for column #{message}" if column.first.class != value.class

          column.include? value
        else
          # raise StandardError, "Value should be of class #{column.class} for column #{message}" if column.class != value.class

          column == value
        end
      end
    end

    def self.find_by(condition)
      where(condition).first
    end
  end
end
