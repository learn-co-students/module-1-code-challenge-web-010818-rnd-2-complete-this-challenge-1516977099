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
