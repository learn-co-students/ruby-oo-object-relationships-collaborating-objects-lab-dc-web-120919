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
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        Artist.all.each do |artist|
            if artist.name == name 
                return artist
            end 
        end 
        new_artist = Artist.new(name)
        return new_artist
    end 

    def print_songs
        #lists all of the artists songs
        songs.each {|song| puts song.name}
    end

end