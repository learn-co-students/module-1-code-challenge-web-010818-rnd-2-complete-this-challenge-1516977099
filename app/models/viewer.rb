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
