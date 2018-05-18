class SportsOdds::CLI
  attr_accessor :booking_company

  @booking_company = nil
  @team_choice = nil

  def self.call
    self.hey
    self.booking_companies
    self.menu
  end

  #Welcome user
  def self.hey
    puts "Welcome the Sports Odds World!"
  end

  #Provide a list of booking companies and ask for user to pick one
  def self.booking_companies
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
  def self.menu
    puts ""
    puts "Please pick a team from the following list."
    puts ""
    SportsOdds::Odds.list_teams
    puts ""
    puts "Enter your team now or type 'exit' to leave the terminal."
    puts ""
    input = gets.strip.upcase
    if input == "EXIT"
      bye
    elsif
      #keep looping until user wants to exit
      while input != "EXIT"
        @team_choice = nil
        #assigns @team_choice if user provides a valid answer
        SportsOdds::Odds.all.each do |team|
          if input == team.name.upcase
            @team_choice = team
          end
        end
        #return odds if user provides a valid answer, otherwise alerts error and contnues to loop
        if @team_choice != nil
          self.odds(@team_choice)
        else
          puts ""
          puts "Invalid answer. Type in your team again or 'exit' to leave the terminal."
          input = gets.strip.upcase
          input == 'EXIT' ? self.bye : self.menu
          puts ""
        end
      end#while
    end #if/else
  end #menu

  def self.odds(team)
    puts ""
    puts "#{team.name.capitalize} odds are#{team.odds}"
    puts ""
    puts "Would you like another team? (Y/N)."
    input = gets.strip.upcase
    #continues if user wants more odds
    if input == "N"
      bye
    elsif input == "Y"
      menu
    else
      puts ""
      puts "Invalid answer. Type in your team again or 'exit' to leave the terminal."
      input = gets.strip.upcase
      input == 'EXIT' ? self.bye : self.menu
      puts ""
    end
  end

  def self.bye
    puts ""
    puts "You are now exiting the terminal. PEACE."
    exit
  end

end #class
