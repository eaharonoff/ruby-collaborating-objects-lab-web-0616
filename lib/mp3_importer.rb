require 'pry'
class MP3Importer

  def initialize (file_path)
    @test_path = File.path(file_path)
    @files = []
  end
  
  def path
    @test_path
  end

  def files
    Dir.foreach(self.path) do |mp3_file|
      next if mp3_file == '.' or mp3_file == '..'
      @files << mp3_file
    end
    @files
  end

  def import
    self.files.each do |song_file|
      new_song = Song.new_by_filename(song_file)
      if new_song.artist.class.find_by_name(new_song.artist.name) == nil
      new_song.artist.save
      end
      artist_instance = new_song.artist
      artist_instance.add_song(new_song)
    end
  end
end