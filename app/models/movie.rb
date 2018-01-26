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
