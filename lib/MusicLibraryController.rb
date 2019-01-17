class MusicLibraryController
  
  attr_accessor :path
  
  # #initialize accepts one argument, the path to the MP3
  # files to be imported.
  # The 'path' argument defaults to '.db/mp3s'.
  # Invokes the #import method on the created MusicImporter
  # object.
  def initialize(path = './db/mp3s')
    #@path = path
    @ImportedMusic = MusicImporter.new(path)
    @ImportedMusic.import
  end
  
  # Welcomes the user.
  # asks the user for input
  # loops and asks for user input until they type in exit.
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = nil
    while input != "exit"
      input = gets.strip
    end
  end
  
  # #list_songs prints all songs in the music library in a
  # numbered list (alphabetized by song name)
  def list_songs
    #get song names
    songNames = []
    Song.all.each {|songinstance|
      songNames << songinstance.name
    }
    
    # Sort songnames
    songNames.sort!
    
    # Iterate through sorted songs
    songNames.each{|songName|
      puts
  end
    
end
