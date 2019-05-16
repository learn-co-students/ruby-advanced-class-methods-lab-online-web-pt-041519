require 'pry'
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
    song = Song.new
    song.save
    song
  end 
  
  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end
  
  def self.create_by_name(song)
    new_song = self.create 
    new_song.name = song
    new_song
  end
  
  def self.find_by_name(song)
    self.all.detect{|w|song == w.name}
  end 
    
  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end
  
  def self.alphabetical
    #binding.pry
    self.all.sort_by{|w| w.name}
  end
  
  def self.new_from_filename(file_data)
    x = file_data.split(/\.|\s-\s/).reject{|word| word == "mp3"}
    name = x[1]
    artist_name = x[0]
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end
  
   def self.create_from_filename(file_data)
    song = self.new_from_filename(file_data)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
