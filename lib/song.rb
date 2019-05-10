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

  # Create new song
  def self.create
    song = self.new
    song.save
    song
  end

  # Create new song by name
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  # Create new song w/ name; save to @@all this time
  def self.create_by_name(name)
    song = self.create 
    song.name = name
    song
  end

  # Find and return instance of song w/ name
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  # Return song if it exists; else create new song by name
  def self.find_or_create_by_name(name)
    !self.find_by_name(name) ? self.create_by_name(name) : self.find_by_name(name)
  end

    # Return @@all songs in ascending (a-z) alphabetical order
    def self.alphabetical
      self.all.sort_by { |song| song.name } 
    end


    # Create new song from file name format 'artist_name - song_name.mp3'
    def self.new_from_filename(filename)
      filename = filename.delete_suffix(".mp3").split(" - ")
      song = self.create 
      song.name = filename[1]
      song.artist_name = filename[0]
      song
    end

    # Create new song from file name format 'artist_name - song_name.mp3'
    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
    end

    # Reset the @@all array
    def self.destroy_all
      self.all.clear
    end

end
