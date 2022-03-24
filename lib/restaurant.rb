class Restaurant
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
end