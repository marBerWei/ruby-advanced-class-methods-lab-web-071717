require 'pry'
class Song
  attr_accessor :name,:artist_name,:mp3
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
    #right now this is returning an array of saved songs
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
    #returns nil or string of instance
  end

  def self.find_or_create_by_name(name)
    object = ''
    if find_by_name(name) == nil
      object = create_by_name(name)
    else 
      object = find_by_name(name)
    end
    object 
  end

  def self.alphabetical
  
    name_array = Song.all.map do |song|
      song.name
    end  

    sorted = name_array.sort
    sorted.map do |name|
      Song.find_or_create_by_name(name)
    end  
  end

  def self.new_from_filename(mp3)
    array = mp3.split("-")
    artist = array[0].strip
    name = array[1].slice(1,array[1].length).gsub(".mp3","")
    song = Song.new 
    song.artist_name = artist 
    song.name = name
    song
  end

  def self.create_from_filename(mp3)
    array = mp3.split("-")
    artist = array[0].strip
    name = array[1].slice(1,array[1].length).gsub(".mp3","")
    song = Song.new 
    song.artist_name = artist 
    song.name = name
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end

# babbino = Song.new
# babbino.name = "o mio"

# binding.pry
 