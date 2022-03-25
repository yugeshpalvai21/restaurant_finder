class Restaurant
  attr_accessor :name, :cuisine, :price

  def self.file_path=(name=nil)
    @@file_path = name
  end

  def self.file_path
    @@file_path
  end

  def self.file_exists?
    return true if file_path && File.exists?(file_path)
  end

  def self.create_file
    return true if file_path && File.open(file_path, 'w')
  end

  def initiallize
    @name = nil
    @cuisine = nil
    @price = nil
  end

  def save
    File.open(Restaurant.file_path, 'a') do |file|
      file.puts "#{name}\t#{cuisine}\t#{price}"
    end
    return true
  end
end