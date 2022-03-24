require_relative './restaurant'

class Guide
  def initialize(file_path)
    Restaurant.file_path = file_path
    if Restaurant.file_exists?
      puts "Yes!! Found Restraurant file"
    elsif Restaurant.create_file
      puts "Created New File"
    else
      puts "Exiting!!"
      exit!
    end
  end

  def launch!
    #introduction
    introduction
    #interactive loop to perform actions until user wants exits
    #conclusion
    conclusion
  end

  def introduction
    puts "\n\t### HELLO!!! Welcome To The Restaurent Finder App ###"
    puts "\n\t>>> This is Interactive App helps you to find best food in restaurents <<<"
  end

  def conclusion
    puts "\n\t### Thanks for using the App, Please Visit Again ###"
  end
end