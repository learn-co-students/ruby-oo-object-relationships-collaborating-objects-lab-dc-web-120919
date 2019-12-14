class MP3Importer 
attr_reader :path
   
def initialize(path)
        @path = path
        
end 

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end 

 def import 
 #takes a filename and makes a song from it. 
 #then imports files. 
 files.each do |f| Song.new_by_filename(f)
 end 
 end 
end 
