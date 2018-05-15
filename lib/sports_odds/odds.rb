class SportsOdds::Odds

  def make_booking_company
    SportsOdds::BookingCompanies.new("bookmaker","book-93")
    SportsOdds::BookingCompanies.new("5dimes","book-19")
    SportsOdds::BookingCompanies.new("heritage","book-169")
    SportsOdds::BookingCompanies.new("betonline","book-1096")
    SportsOdds::BookingCompanies.new("bovada","book-999996")
    SportsOdds::BookingCompanies.new("intertops","book-180")
    SportsOdds::BookingCompanies.new("youwager","book-139ß")
  end

  def choose_booking_company(company)
    #get css class names based on company
    # list companies
    # if company == one of the companies
    #   return class names
    # end
  end

end
