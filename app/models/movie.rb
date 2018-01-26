class Movie
  @@all=[]
  attr_accessor :title

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def watchlistings
    WatchListing.all.select do |wl|
      wl.movie==self
    end
  end

  def viewers
    WatchListing.all.map do |wl|
      if wl.movie==self
        wl.viewer
      end
    end
  end

  def average_rating
    ratings=[]
    WatchListing.all.each do |wl|
      ratings<<wl.rating
    end
    whole=ratings.inject{|sum,el| sum+el}
    whole2=whole.to_f
    whole2/ratings.length
  end

  def self.highest_rated
    highest=0
    movie=[]
    WatchListing.all.find do |wl|
      int=wl.movie.average_rating
      if int>highest
        highest=int
        movie<<wl.movie
      end
    end
    movie.last
  end





end
