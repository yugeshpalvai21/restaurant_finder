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
    result = nil
    until result == :quit do
      puts "Please Select What you want (find, add, sort, quit):"
      print "> "
      user_response = gets.chomp
      result = do_action(user_response)
    end
    #conclusion
    conclusion
  end

  def do_action(response)
    case response.downcase
    when 'find'
      puts "Finding Restaurent"
    when 'add'
      puts "Adding Restaurants"
    when 'sort'
      puts "Sorting Restaurents"
    when 'quit'
      return :quit
    else
      puts "We're not able to process, Please Try Again>>"
    end
  end

  def introduction
    puts "\n\t### HELLO!!! Welcome To The Restaurent Finder App ###"
    puts "\n\t>>> This is Interactive App helps you to find best food in restaurents <<<"
  end

  def conclusion
    puts "\n\t### Thanks for using the App, Please Visit Again ###"
  end
end