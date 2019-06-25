# require "pry"
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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(new_name)
    song = Song.new
    song.name = new_name
    song
  end

  def self.create_by_name(name)
    variable = new_by_name(name)
    variable.save
    variable
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name  == song_name}
    
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      # binding.pry
      self.create_by_name(song_name)
    end
end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    new_file_name = file_name.split(" - ")
    new_new_file_name = new_file_name[1].split(".")
    song_name = new_new_file_name[0]
    variable_song = Song.new
    variable_song.name = song_name
    artist_name = new_file_name[0]
    variable_song.artist_name = artist_name
    variable_song
    # binding.pry


  end

  def self.create_from_filename(file_name)
    new_file_name = file_name.split(" - ")
    new_new_file_name = new_file_name[1].split(".")
    song_name = new_new_file_name[0]
    variable_song = Song.new
    variable_song.name = song_name
    artist_name = new_file_name[0]
    variable_song.artist_name = artist_name
    variable_song.save
   
  end

  def self.destroy_all
    @@all = []
  end

end


