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
    self.all << song
    song
  end
  
  def self.new_by_name(title)
    song = self.new 
    song.name = title
    song 
  end 
  
  def self.create_by_name(title)
    song = self.create 
    song.name = title
    song 
  end 
  
  def self.find_by_name(title) 
    found_song = self.all.find {|song| song.name == title}
    found_song
  end 
  
  def self.find_or_create_by_name(title) 
    self.find_by_name(title) || self.create_by_name(title)
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    #parse the data
    song = filename.split(" - ")
    song[1].chomp!(".mp3")
    artist = song[0]
    song_title = song[1]
    
    #make new instance with above data
    new_song = self.new 
    new_song.name = song_title
    new_song.artist_name = artist
    new_song
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    new_song = self.create
    new_song.name = song.name
    new_song.artist_name = song.artist_name
    new_song
  end
  
  def self.destroy_all
    self.all.clear 
  end 
end
