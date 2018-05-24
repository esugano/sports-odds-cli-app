class SportsOdds::Odds
  attr_accessor :name, :odds

  @@all = []

  def initialize(name, odds)
    @name = name
    @odds = odds
    @@all << self
  end

  def self.all
    @@all
  end

#hardcode since I can't pull names from css titles
  def self.make_booking_company
    SportsOdds::BookingCompanies.new("bookmaker","book-93")
    SportsOdds::BookingCompanies.new("5dimes","book-19")
    SportsOdds::BookingCompanies.new("heritage","book-169")
    SportsOdds::BookingCompanies.new("betonline","book-1096")
    SportsOdds::BookingCompanies.new("bovada","book-999996")
    SportsOdds::BookingCompanies.new("intertops","book-180")
    SportsOdds::BookingCompanies.new("youwager","book-139ß")
    SportsOdds::BookingCompanies.all
  end

#list booking companies
  def self.list_booking_companies
    self.make_booking_company.each do |booking_company|
      puts booking_company.name.capitalize
    end
  end

#get css class names (to use in scraping) based on booking company
  def self.choose_booking_company(company)
    SportsOdds::BookingCompanies.all.detect do |booking_company|
      if booking_company.name == company.downcase
        booking_company.class_name
      end
    end
  end

#list teams based off user's booking company pick
  def self.list_teams
    @@all.each do |team|
      puts team.name.upcase
    end
  end

end #class
