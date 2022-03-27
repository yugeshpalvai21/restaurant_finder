require_relative './restaurant'
require_relative './actions'

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
    actions = ['list', 'add', 'find', 'quit']
    until result == :quit do
      action, args = get_action
      next unless listed_actions(action)
      result = do_action(action, args)
    end
    #conclusion
    conclusion
  end

  def get_action
    puts "Please Select What you want (list, add, find, quit):"
    print "> "
    user_response = gets.chomp.strip.split(" ")
    action = user_response.shift
    args = user_response
    return [action, args]
  end

  def listed_actions action
    Actions::Names.include?(action)
  end

  def do_action(action, args=[])
    case action.downcase
    when 'list'
      list_restaurants(args)
    when 'add'
      add_restaurant
    when 'find'
      puts "Enter Search word-"
      print "> "
      search_term = gets.chomp.strip
      find_restaurant search_term
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

  def list_restaurants args
    puts "\t ### List Of Restaurants ###"
    @restaurants = Restaurant.new.all
    sort_order = args.shift
    if sort_order == 'by'
      sort_order = args.shift
    end
    sort_order ||= 'name'

    @restaurants.sort! do |r1, r2|
      case sort_order
      when 'cuisine'
        r1.cuisine <=> r2.cuisine
      when 'price'
        r1.price.to_i <=> r2.price.to_i
      else
        r1.name <=> r2.name
      end 
    end

    puts "Listing Restaurants In The Order Of - #{sort_order.upcase}"

    @restaurants.each do |restaurant|
      puts "#{restaurant.name}\t#{restaurant.cuisine}\t$#{restaurant.price}"
    end
  end

  def find_restaurant search
    @restaurants = Restaurant.new.find search
    if @restaurants.empty?
      puts "It Seems There Is No Restaurants with your search!! TRY AGAIN"
    else
      @restaurants.each do |restaurant|
        puts "#{restaurant.name}\t#{restaurant.cuisine}\t$#{restaurant.price}"
      end
    end
  end

  def conclusion
    puts "\n\t### Thanks for using the App, Please Visit Again ###"
  end
end