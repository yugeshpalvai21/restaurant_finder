class Guide
  def initialize(file_path)
    @file_name = file_path
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