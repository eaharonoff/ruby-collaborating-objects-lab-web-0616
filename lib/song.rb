class Song
  attr_accessor :name, :artist, :artist_name
  
  def initialize(song)
    @name = song
  end

  def self.new_by_filename(filename)
    filename_arr = filename.split(" - ")
      song = filename_arr[1]
      the_song = Song.new(song)
      artist = filename_arr[0]
      the_artist = Artist.new(artist)
      the_song.artist=(the_artist)
      the_song
  end


end