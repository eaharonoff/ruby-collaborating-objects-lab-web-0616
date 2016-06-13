class Artist
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    self.name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song
  end

  def self.all 
    @@all
  end

  def save
      self.class.all << self
  end

  def self.find_by_name(artist)
    the_artist = self.all.select{|artist_instance| artist_instance.name == artist} 
    the_artist[0]
  end

  def self.find_or_create_by_name(artist)
    self.find_by_name(artist) ? self.find_by_name(artist) : Artist.new(artist)
  end

  def print_songs
    @songs.each{|song| puts song.name}
  end
end