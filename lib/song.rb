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
    Song.all.select{ |song| song.name == name }[0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end
  
  def self.new_from_filename(name)
    first = name.split(" - ")
    artist = first[0]
    song_name = first[-1]
    song_name.slice!(".mp3")
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end
end
