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
    song = self.new
    song.save
    return song
  end
  
  def self.new_by_name(string_name)
    song = Song.new
    song.name = string_name
    return song
  end
  
  def self.create_by_name(string_name_of_song)
    song = self.new
    song.name = string_name_of_song
    song.save
    song
  end
  
  def self.find_by_name(name_of_song)
    self.all.each do |song|
      if song.name == name_of_song
          return song
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(name_of_song)
    return_value = Song.find_by_name(name_of_song)
      if !return_value
        Song.create_by_name(name_of_song)
      else
        return return_value
      end
  end
  
  def self.alphabetical
    self.all.sort_by { |obj| obj.name }
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(/( )(-)( )|(.mp3)/)
    song = self.new
    song.artist_name = filename_array[0]
    song.name = filename_array[4]
    return song
  end
  
  def self.create_from_filename(filename)
    filename_array = filename.split(/( )(-)( )|(.mp3)/)
    song = self.new
    song.artist_name = filename_array[0]
    song.name = filename_array[4]
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
end
