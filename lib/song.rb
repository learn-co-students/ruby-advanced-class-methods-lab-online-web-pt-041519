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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.all.uniq
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    data = filename.chomp(".mp3").split(" - ")
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    data = filename.chomp(".mp3").split(" - ")
    song.artist_name = data[0]
    song.name = data[1]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
