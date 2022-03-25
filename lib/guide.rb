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
    actions = ['find', 'add', 'sort', 'quit']
    until result == :quit do
      puts "Please Select What you want (find, add, sort, quit):"
      print "> "
      user_response = gets.chomp
      processed_response = user_response.downcase.strip
      next unless actions.include?(processed_response)
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
      add_restaurant
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

  def add_restaurant
    restaurant = Restaurant.new
    puts "Please Enter Restaurant Name --"
    print "> "
    restaurant.name = gets.chomp.strip
    puts "Please Enter Cuisine Type --"
    print "> "
    restaurant.cuisine = gets.chomp.strip
    puts "Please Enter Price --"
    print "> "
    restaurant.price = gets.chomp.strip
    if restaurant.save
      puts "Restaurant Saved!!!"
    else
      puts "Something Went Wrong, Please Try Again"
    end
  end

  def conclusion
    puts "\n\t### Thanks for using the App, Please Visit Again ###"
  end
end