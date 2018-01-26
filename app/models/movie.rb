class Movie
  attr_accessor :title, :rating, :viewers

  @@all = []

  def initialize(title)
    @title = title
    @viewers = []
    @ratings = []
    self.class.all << self
  end

  def watchlistings
    Watchlisting.all.select{|watchlisting| watchlisting.include?(self) }
  end

  def self.all
    @@all
  end

  def average_rating
    @ratings.reduce(:+)/@ratings.size
  end

  def self.highest_rated
    Movie.all.map{|movie| movie.rating}.sort_by[0]
  end

end
