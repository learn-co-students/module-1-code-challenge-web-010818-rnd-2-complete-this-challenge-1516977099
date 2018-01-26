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
       obj.viewers
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








# Movie.all
# returns an array of all movies
# Movie#watchlistings
# returns an array of all the watchlist objects that contain that movie
# Movie#viewers
# returns all of the viewers who added this movie to their watchlist
# Movie#average_rating
# returns the average of all ratings across all viewers watchlist ratings
# Movie.highest_rated
# should return the movie with the highest average rating across all the viewers watchlistings
