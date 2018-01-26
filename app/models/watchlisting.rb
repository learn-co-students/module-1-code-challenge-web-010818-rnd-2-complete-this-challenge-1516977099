class WatchListing
  @@all=[]
  attr_accessor :viewer,:movie,:rating

  def initialize(viewer,movie)
    @viewer=viewer
    @movie=movie
    @@all<<self
  end

  def self.all
    @@all
  end

end
