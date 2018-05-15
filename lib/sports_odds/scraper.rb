class SportsOdds::Scraper

  def get_page
   Nokogiri::HTML(open("https://js.sbrfeeds.com/index.php/future?iframeid=iframe-odds-widget-5849247360332532&timezone=16&theme=future&markettypeid=311&odds-type=US&version=2.0&books=93,19,169,1096,999996,180,139&trackers=1518124627581.xml&event-id=3399565"))
  end

  def make_teams
    #make teams based on booking company
  end

end
