class SportsOdds::CLI
  attr_accessor :booking_company

  @booking_company = nil
  @team_choice = nil

  def call
    hey
    booking_companies
    menu
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

  #Provide list of teams and ask user to pick one to return odds
  def menu
    puts ""
    puts "Please pick a team from the following list."
    SportsOdds::Odds.list_teams
    puts ""
    puts "Enter your team now or type 'exit' to leave the terminal."
    puts ""
    input = gets.strip.upcase
    if input == "EXIT"
      bye
    else
      while input != "EXIT"
        SportsOdds::Odds.all.each do |team|
          if input == team.name.upcase
            puts ""
            puts "#{input.capitalize} odds are #{team.odds}"
            puts ""
            puts "Would you like another team? (Y/N)."
            input = gets.strip.upcase
            if input == "N"
              bye
            elsif input == "Y"
              menu
            else
              puts "Mr. Terminal didn't get that."
              input = gets.strip.upcase
            end
          else
            bye
          end
        end
      end #while
    end #if/else
  end #menu

  def bye
    puts "You are now exiting the terminal. PEACE."
    exit
  end

end #class
