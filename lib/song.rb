class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.find { |e| e.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    @@all.sort_by { |e| e.name }
  end


# file_name = "Thundercat - For Love I Come.mp3"
  def self.new_from_filename(file_name)
    arr = file_name.split("-")
    artist_name = arr.first.strip
    song_name = arr.last.strip.chomp(".mp3")
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

#describe '.create_from_filename' do
    # it 'initializes and saves a song and artist_name based on the filename format' do

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end


  def self.destroy_all
    self.all.clear
  end

end

song = Song.new_by_name("22") 
