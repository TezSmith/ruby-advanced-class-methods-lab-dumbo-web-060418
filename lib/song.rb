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

#instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = Song.new
    song.save
    song
  end

#instantiates a song with a name property
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

#instantiates and saves a song with a name property
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

#can find a song present in @@all by name
  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

#invokes .find_by_name and .create_by_name instead of repeating code
#returns the existing Song object (doesn't create a new one)
#when provided the title of an existing Song
#invokes .find_by_name and .create_by_name instead of repeating code
#creates a new Song object with the provided title if one doesn't already exist
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

#returns all the song instances in alphabetical order by song name
  def self.alphabetical
      all.sort_by {|song| song.name }
  end

#initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    #my code worked but I couldn't get the spacing to format properly
    # filename = song.split(/[-.]/).keep_if {|word| word != "mp3"}
    # song = self.new
    # song.name = filename[1]
    # song.artist_name = filename[0]
    # song
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

#initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    #my code worked but I couldn't get the spacing to format properly
    # filename = song.split(/[-.]/, "").keep_if {|word| word != "mp3"}
    # song = self.create
    # song.name = filename[1]
    # song.artist_name = filename[0]
    # song
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

#clears all the song instances from the @@all array
  def self.destroy_all
    @@all.clear
  end

end
