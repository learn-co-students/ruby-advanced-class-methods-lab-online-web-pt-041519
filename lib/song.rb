class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{
      |sn| sn.name == name
    }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) # Use || to choose find_by_name or create_by_name
  end

  def self.alphabetical()
    @@all.sort_by{
      |sn| sn.name
    }
  end

  def self.new_from_filename(name)
    # Source: https://ruby-doc.org/core-2.6.1/doc/regexp_rdoc.html
    song = self.new
    song.name = name.split(/[^a-zA-Z\s]|\s-\s/)[1].chomp(".mp3")
    song.artist_name = (name.split(/[^a-zA-Z\s]|\s-\s/)[0])
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(/[^a-zA-Z\s]|\s-\s/)[1].chomp(".mp3"))
    song.artist_name = (name.split(/[^a-zA-Z\s]|\s-\s/)[0])
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all()
    @@all.clear
  end
end
