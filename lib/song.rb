require 'pry'
class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(song) 
        song_filename_array = song.split(" - ")
        song = self.new(song_filename_array[1])
       # binding.pry
        song.artist_name = song_filename_array[0]
        song
    end

# Song #artist_name= accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end
end