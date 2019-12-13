class Song

    attr_accessor :name, :artist 

    @@all = []

    def initialize(name)
        
        @name = name 
        @@all << self 
    end 

    def self.all

        return @@all 
    end 

    def self.new_by_filename(file)

        #splits filename into different strings for usage
        filename_split = file.split (' - ')
        filename_artist = filename_split[0]
        filename_songname = filename_split[1]
        #generates a new song instance with filename_songname as the title of the song
        new_song = self.new(filename_songname)
        #searches for artist objects to find artist by name. If not found, creates one.
        new_artist = Artist.find_or_create_by_name(filename_artist)
        new_song.artist = new_artist 
        return new_song 
    end 

    def artist_name=(artist_name)
        
        artist_object = Artist.find_or_create_by_name(artist_name)
        self.artist = artist_object 
    end 
end 