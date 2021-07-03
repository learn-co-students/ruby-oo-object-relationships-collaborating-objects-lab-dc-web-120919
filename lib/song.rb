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

    def self.new_by_filename(filename)
        #creates a new instance of a song from the file that's passed 
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song

    end 

    def artist_name=(name)
        #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
      end


end