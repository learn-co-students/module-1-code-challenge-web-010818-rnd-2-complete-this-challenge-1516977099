class WatchListing


@@all = []

attr_accessor :viewer, :movie, :rating

def initialize(viewer, movie, rating=nil)
  @viewer = viewer
  @movie = movie
  @rating = rating
  @@all << self
end

def self.all
  @@all
end



end



# Watchlisting.all
# returns all of watchlistings
# Watchlisting#viewer
# returns the viewer associated with this watchlisting
# Watchlisting#movie
# returns the movie associated with this watchlisting
# Watchlisting#rating
# returns the viewer's rating for the movie associated with this watchlisting
