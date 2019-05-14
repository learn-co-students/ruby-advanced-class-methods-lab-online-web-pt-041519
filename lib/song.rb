# require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save(song)
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end


  def self.new_from_filename(file)
    new_string = file.gsub(/.mp3/, "")
    song_array = new_string.split("-").map {|element| element.strip}
    
    song = self.new
    song.artist_name = song_array[0]
    song.name = song_array[1]
    song

  end

  def self.create_from_filename(file)
    new_string = file.gsub(/.mp3/, "")
    song_array = new_string.split("-").map {|element| element.strip}
    
    song = self.new
    song.artist_name = song_array[0]
    song.name = song_array[1]
    @@all << song

  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end



  def save(name)
    self.class.all << self
  end


  
end
