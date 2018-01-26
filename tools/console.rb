require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end



thor = Movie.new("thor")
iron = Movie.new("iron man")
hulk = Movie.new("hulk")


vic = Viewer.new("viasdas")
rish = Viewer.new("rishi")
johann = Viewer.new("johann")


watchlisting1 = WatchListing.new(vic, thor, 5)
watchlisting2 = WatchListing.new(rish, thor, 3)
watchlisting3 = WatchListing.new(johann, thor, 4)
watchlisting4 = WatchListing.new(vic, iron, 5)
watchlisting5 = WatchListing.new(rish, hulk, 5)
watchlisting6 = WatchListing.new(johann, iron, 3)
watchlisting1 = WatchListing.new(vic, hulk, 3)





Pry.start
