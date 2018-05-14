class SportsOdds::CLI
  attr_accessor :booking_company, :team_choice

  @booking_company = nil
  @team_choice = nil

  def call
    hey
    menu
  end
  # 1. Welcome user
  def hey
    puts "Welcome the Sports Odds World!"
  end

  # 2. Provide a list of booking companies
  def booking_companies
    puts ""
    puts "Booking companies have different sports odds. Pick a booking company to see some odds. Otherwise, type 'exit.'"
    puts "Booking companies 123"
  # 3. Ask for user to pick a booking company
    @booking_company = gets.strip.downcase
  end

  # 4. Provide list of teams
  def team_list
    puts ""
    puts "team list"
  # 5. Ask for user to pick a team
    @team_choice = gets.strip.downcase
  end

  # 6. Return odds based off user picks
  def odds
    puts ""
    puts "The 49ers odds of winning is 100%. Just saying."
  end

  def bye
    puts "You are now exiting the terminal. PEACE."
    exit
  end

  def menu
    # 6. Return odds based off user picks
    # 7. Ask user to exit or get more odds?
    # 8. Ask for booking company again
    # 9. Ask for team again
    # 10. Return odds
    # 11. Loop through 7-10 until user exits
    # 12. If exit, say good-bye
    booking_company
    if @booking_company != 'exit'
      team_list
      odds
      puts ""
      puts "Would you like to see more odds (using the same booking company) or exit?"
      @team_choice = gets.strip.downcase
      menu
    else
      bye
    end

  end #menu

end #class
