class MP3Importer 

    attr_accessor :path 

    def initialize(file_path)

        @path = file_path 
        
    end 

    def files
        
        #collects all files from a specific directory
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end 

    def import 

        self.files.each { |file| Song.new_by_filename(file)}
    end 

end 