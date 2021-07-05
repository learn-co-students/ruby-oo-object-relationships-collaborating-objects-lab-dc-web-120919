class Artist

    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        
        return @@all
    end 

    def songs 

        #returns array of all songs where song.artist is the same as the artist object
        #used to search 
        return Song.all.select {|song| song.artist == self}
    end 

    def add_song(song_name)

        song_name.artist = self 
    end 

    def self.find_or_create_by_name(name)

        #searches through the entirety of Artist.all
        #finds a specific artist and returns it
        #if artist is not found, it will create a new artist and return it 

        Artist.all.each do |artist|
            
            if artist.name == name 

                return artist
            end 
        end 

        new_artist = Artist.new(name)
        return new_artist
    end 


    def print_songs

        #take the songs from self then prints out the songs 
        self.songs.each do |song|
            puts song.name
        end 
    end 

end 