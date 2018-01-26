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




# Viewer.all
# returns all of the viewers
# Viewer#add_to_watchlist(movies)
# this method should receive an array of one or more movie instances and add them to the viewer's watchlisting
# Viewer#rate_movie(movie, rating)
# given a movie on a viewer's watchlisting and a rating (a number between 1 and 5), assign the rating to the movie. Where should the rating that an individual viewer gives to an individual movie be stored?
