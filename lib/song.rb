class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

def self.create
  new_song = Song.new
  new_song.save
end
 

