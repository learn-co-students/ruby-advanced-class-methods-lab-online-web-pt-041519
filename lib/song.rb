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
  
  def self.new_by_name(new_song_name)
    song = self.new
    song.name = new_song_name
    song.save
    song
  end 
  
  def self.create_by_name(new_song_name)
    song = self.new
    song.name = new_song_name
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end 
  
  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 
  
  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end 
  
  
  def self.destroy_all
    @@all.clear
  end 
  
end
