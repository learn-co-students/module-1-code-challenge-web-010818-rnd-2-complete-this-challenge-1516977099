# Please copy/paste all three classes into this file to submit your solution!
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
########################################################################################################################################


class Movie

  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end


  def watchlistings
     WatchListing.all.select do |obj|
      obj.movie == self
    end
   end

   def viewers
     self.watchlistings.collect do |obj|
       obj.viewer
     end
   end

   def average_rating
     total = 0
     avg = 0
     rating_arr = self.watchlistings.collect |obj|
        obj.rating
      end
      rating_arr.each do |num|
        total += num

      end
      avg =  total/rating_arr.length
      avg
   end


   def self.highest_rated
     higest = 0
     higest_rated = ""
     self.all.collect do |movie_instance|
      if movie_instance.average_rating > higest
        higest = movie_instance.average_rating
        higest_rated = movie_instance
        end
      end
    higest_rated
    end

end




################################################################################




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
