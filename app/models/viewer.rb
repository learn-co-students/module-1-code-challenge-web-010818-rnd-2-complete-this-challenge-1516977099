class Viewer
  attr_accessor :username, :watchlist

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
    @watchlist = []
  end

  def add_to_watchlist(movies)
    movies.each{|movie| self.watchlist << movie}
  end

  def rate_movie(movie, rating)
    Watchlisting.all.find{|listing| listing.title == movie.title}.rating = rating
    movie.viewers << self.username
  end

  def self.all
    @@all
  end

end
