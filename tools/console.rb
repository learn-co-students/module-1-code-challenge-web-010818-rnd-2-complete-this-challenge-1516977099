require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

fara = Viewer.new("fara")
jumanji = Movie.new("jumanji")

Pry.start
