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
    return song
  end
    
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
    
  end
  
  def self.find_by_name(name)
    song = self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    end
    return song
  end
        
  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    return sorted
  end
    
  def self.new_from_filename(filename)
    nameWithoutExtension = filename[0..-5]
    splitName = nameWithoutExtension.split(" - ")
    
    song = self.new
    song.artist_name = splitName[0]
    song.name = splitName[1]
    return song
  end
    
  def self.create_from_filename(filename)
     nameWithoutExtension = filename[0..-5]
    splitName = nameWithoutExtension.split(" - ")
    
    song = self.create
    song.artist_name = splitName[0]
    song.name = splitName[1]
    return song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
