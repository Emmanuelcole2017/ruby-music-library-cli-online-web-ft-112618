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
  # Is not hard-coded
  def list_songs
    #get song names
    songNames = []
    Song.all.each {|songinstance|
      songNames << songinstance.name
    }
    
    # Sort songnames
    songNames.sort!
    
    # Iterate through sorted songs and output them.
    songNames.each_with_index{|songName, index|
      puts "#{index + 1}. #{Song.find_by_name(songName).artist.name} - #{songName} - #{Song.find_by_name(songName).genre.name}"
    }
  end
  
  # #list_artists prints all artists in the music library in
  # a numbered list (alphabetized by artist name)
  # Is not hard-coded
  def list_artists
    # Get all artists names
    artistNames = []
    Artist.all.each{|artistInstance|
      artistNames << artistInstance.name
    }
    
    # Sort Artist names
    artistNames.sort!
    
    # Iterate through artistNames and output them
    artistNames.each_with_index{|artistName, index|
      puts "#{index + 1}. #{artistName}"
    }
  end
  
  # #list_genres prints all genres in the music library
  # in a numbered list (alphabetized by artist name).
  def list_genres
    # get genre names
    genreNames = []
    Genre.all.each{|genre|
      genreNames << genre.name
    }
    
    # Sort the genreNames
    genreNames.sort!
    
    # Output the genreNames
    genreNames.each_with_index{|genreName, index|
      puts "#{index + 1}. #{genreName}"
    }
  end
  
  # #list_songs_by_artist prompts the user to enter an
  # artist
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artistName = gets.strip
    
    # Stores matching song songInstances
    matchingSongs = []
    
    # Iterate through songs and store matches.
    Song.all.each{|songInstance|
      if songInstance.artist.name == artistName
        matchingSongs << songInstance
      end
    }
    
    # Outputs the matching song name and genre
    matchingSongs.each_with_index{|song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    }
  end
end
