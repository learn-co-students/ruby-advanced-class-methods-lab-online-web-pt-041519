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
    self.all << song.save
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
     song.save
     song 
    end
    
    def self.find_by_name(name)
      
      self.all.find {|song| song.name == name }
    end
    
    def self.find_or_create_by_name(name)
            create_by_name(name)
           find_name = find_by_name(name)
      if find_name == nil
        song = self.new
        song.name = name 
        song.save
        song
      
      else
      find_name
      end
    end
    
    def self.alphabetical
      
      self.all.sort_by{|song| song.name}
    end
    
    def self.new_from_filename(file_name)
      song = self.new 
      new_array = []
      new_array= file_name.split(/[^a-zA-Z\s]|\s-\s/)
      song.artist_name = new_array[0]
      song.name = new_array[1]
      
      song
    end
    def self.create_from_filename(file_name)
      song = self.new 
      new_array = file_name.split(/[^a-zA-Z\s]|\s-\s/)
      song.artist_name = new_array[0]
      song.name = new_array[1]
      song.save
      song
    end
    def self.destroy_all
      self.all.clear
    end
      
    
    
    
    
    
    
    
    
    
end