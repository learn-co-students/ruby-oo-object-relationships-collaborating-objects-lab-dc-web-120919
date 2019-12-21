require 'pry'
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song_array|
            song_array.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find(name)
        self.all.find{|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        #Find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out.
        self.find(name) ? self.find(name) : self.new(name)
    end

    def print_songs
        songs.each do |song_array|
            puts song_array.name
        end
    end
end