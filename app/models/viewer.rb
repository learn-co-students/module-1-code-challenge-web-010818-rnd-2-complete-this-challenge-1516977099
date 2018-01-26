class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_to_watchlist(movie)
    movie.each do |movie_instance|
       WatchListing.new(self, movie_instance)
     end
  end

  def rate_movie(movie, rating)
    rate = WatchListing.all.find do |obj|
      obj.viewer == self && obj.movie == movie
    end
    rate.rating = rating

  end

end
