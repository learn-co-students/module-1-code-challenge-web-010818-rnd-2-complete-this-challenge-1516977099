# Please copy/paste all three classes into this file to submit your solution!
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
			Watchlisting.all.select{ |a| a.movie == self}
	end

	def viewers(viewer, rating)
		watchlistings.new(self, viewer, rating)
	end

	def average_rating
		watchlisting_ratings = watchlistings.select{|m| m.rating }
		sum = watchlisting_ratings.inject(0) { |sum, item| sum += item.rating}
		average = sum / watchlisting_ratings.size

	end

	def self.highestrated
		hash = Hash.new
		Appointment.all.each do |a|
			if hash[a.movie]
				hash[a.movie] += 1
			else hash[a.movie] = 1
			end
		end
		sorted_hash = hash.max_by do |key, value|
				value
			end
			sorted_hash[0]
	end



end




class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    @@all << self
  end

  def self.all
    @@all
  end

	def add_to_watchlist(movies)
		movies.each do |m|
			Watchlist.new(self, m)
		end

	end

	def rate_movie(movie, rating)
		Watchlist.new(self, movie, rating)
	end

end



class WatchListing

	attr_accessor :movie, :viewer, :rating
	@@all = []


	def initialize(movie, viewer, rating = nil)
		@movie = movie
		@viewer = viewer
		@rating = rating
		@@all << self
	end

	def self.all
		@@all
	end


end
