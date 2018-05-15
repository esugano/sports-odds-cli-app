class SportsOdds::Odds

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

  def self.list_booking_companies
    self.make_booking_company.each do |booking_company|
      puts booking_company.name.capitalize
    end
  end

  def self.choose_booking_company(company)
    #get css class names based on company
    # list companies
    # if company == one of the companies
    #   return class names
    # end
  end

end
