require "pry"

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
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    artist = data[0]
    s_name = data[1].gsub(".mp3", "")
    song = self.new
    song.artist_name = artist
    song.name =  s_name
    song
  end

  def self.create_from_filename(file_name)
    data = file_name.split(" - ")
    artist = data[0]
    s_name = data[1].gsub(".mp3", "")
    song = self.new
    song.artist_name = artist
    song.name =  s_name
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
