class SportsOdds::CLI
  attr_accessor :booking_company, :team_choice

  @booking_company = nil
  @team_choice = nil

  def call
    hey
    booking_companies
    make_teams
  end

  #Welcome user
  def hey
    puts "Welcome the Sports Odds World!"
  end

  #Provide a list of booking companies and ask for user to pick one
  def booking_companies
    puts ""
    puts "Booking companies have different sports odds. Pick a booking company to see some odds. Otherwise, type 'exit.'"
    SportsOdds::Odds.list_booking_companies
    input = gets.strip.downcase

    #get css class names (to use in scraping) based on booking company
    if input == 'exit'
      bye
    else
      while input != 'exit'
        @booking_company = SportsOdds::Odds.choose_booking_company(input)
        if @booking_company != nil
          SportsOdds::Scraper.scrape_page(@booking_company.class_name)
          puts "Your booking company is #{input.capitalize}."
          input = 'exit'
        else
          puts "Invalid answer. Please try again."
          input = gets.strip.downcase
        end
      end
    end
  end #booking_companies

  #Provide list of teams and ask user to pick one
  def make_teams
    puts ""
    puts "Please pick a team from the following list:"
    SportsOdds::Odds.list_teams
    puts ""
    @team_choice = gets.strip.upcase
    SportsOdds::Odds.all.each do |team|
      if @team_choice == team.name.upcase
        puts ""
        puts "You pick #{@team_choice.capitalize}"
      end
    end
  end

  # SportsOdds::Scraper.scrape_page(bookmaker)
  # SportsOdds::CLI.new.make_teams

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

    booking_companies
    # 6. Return odds based off user picks
    # 7. Ask user to exit or get more odds?
    # 8. Ask for booking company again
    # 9. Ask for team again
    # 10. Return odds
    # 11. Loop through 7-10 until user exits
    # 12. If exit, say good-bye
    # if @booking_company != 'exit'
    #   team_list
    #   odds
    #   puts ""
    #   puts "Would you like to see more odds (using the same booking company) or exit?"
    #   @team_choice = gets.strip.downcase
    #   menu
    # else
    #   bye
    # end

  end #menu

end #class
