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
