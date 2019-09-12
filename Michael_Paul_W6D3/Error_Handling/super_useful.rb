# PHASE 2
def convert_to_int(str)
  begin
    Integer(str) 
  rescue => exception
    # raise Custom_error.new("Not a integer string")
    return nil
  end
end


# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue
    if maybe_fruit == "coffee"
      puts "Feed me a fruit! (Enter the name of a fruit:)"
      retry
    end
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("you have no hobbies")  if fav_pastime.empty?
    raise ArgumentError.new("what do you mean you have no name?") if name.empty?
    raise ArgumentError.new("needs more time to grow") if yrs_known <= 5
    @yrs_known = yrs_known
    @name = name
    @fav_pastime = fav_pastime
  end
  

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


