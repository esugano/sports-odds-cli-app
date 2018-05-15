class SportsOdds::Scraper

  def self.get_page
   Nokogiri::HTML(open("https://js.sbrfeeds.com/index.php/future?iframeid=iframe-odds-widget-5849247360332532&timezone=16&theme=future&markettypeid=311&odds-type=US&version=2.0&books=93,19,169,1096,999996,180,139&trackers=1518124627581.xml&event-id=3399565"))
  end

  def self.scrape_page(booking_company)
    booking = "##{booking_company}"
    @names = []
    @odds = []
    @list_teams = []
    self.get_page.css(".sides").each do |team_odd_combo|

      #scrapes the name of the team
      team_odd_combo.css('.team').each do |each_team|
        @names << each_team.text
      end

      #scrapes the odds for the specific team
      team_odd_combo.css('.lines').each do |each_team|
         each_team.css(booking).each do |each_team_odds|
          @odds << each_team_odds.search('span').text
        end
      end

      #merge @name and @odds into one hash, @list_teams
      @names.each_with_index do |value, index|
        SportsOdds::Odds.new(value,@odds[index])
      end
    end
  end

end
