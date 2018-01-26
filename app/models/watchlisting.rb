class WatchListing
  attr_accessor :movie, :viewer, :rating
  @@all = []

    def initialize(movie, viewer)
      @movie = movie
      @viewer = viewer
      @@all << self
    end




end
