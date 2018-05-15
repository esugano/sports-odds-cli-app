class SportsOdds::BookingCompanies
  attr_accessor :name, :class_name

  @@all = []

  def initialize(name, class_name)
    @name = name
    @class_name = class_name
    @@all << self
  end

  def self.all
    @@all
  end

end
