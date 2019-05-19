class Song
  attr_accessor :name, :artist_name.
    @@all = []

  def self.all
    @@all
  end

  def self.create(song)
    song = self.new
    song.name = name
    @@all << song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
