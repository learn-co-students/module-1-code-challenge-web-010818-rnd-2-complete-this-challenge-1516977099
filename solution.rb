# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  @@all=[]
  attr_accessor :username

  def initialize(username)
    @username = username
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_to_watch_list(movies)
    movies.each do |movie|
      WatchListing.new(self.username,movie)
    end
  end

  def rate_movie(movie,rating)
    WatchListing.all.find do |m|
      if m.viewer==self && m.movie==movie
        m.rating=rating
      end
    end
  end

end





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
