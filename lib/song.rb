class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song =self.new
    @@all << song
    song
  end

  def self.new_by_name(string)
    song= self.new
    song.name =string
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    return song
  end

  def self.find_by_name(title)
    @@all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
    # song1 = self.find_by_name(title)
    # song2 = self.create_by_name(title)
    #   if self.find_by_name(title) == false
    #     self.create_by_name(title)
    #   end
    #   return self.find_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by {|word| word.name}
  end

  def self.new_from_filename(string)
    song= self.new
    song_string= string.chomp(".mp3")
    song_array = song_string.split(" - ")
    song.name = song_array[1]
    song.artist_name = song_array[0]
    return song
  end
  
def self.create_from_filename(filename)
   song = Song.new_from_filename(filename)
   @@all << song
 end

 def self.destroy_all
   self.all.clear
 end
 
end
