require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:
  - help : displays this help message
  - list : displays a list of songs you can play
  - play : lets you choose a song to play
  - exit : exits this program"
end

def list(songs)
  numbered_songs = []
  songs.each_with_index do |song,index|
    numbered_songs << "#{index+1}. #{song}"
  end
  puts numbered_songs
end

def play(songs)
  puts "Please enter a song name or number:"
  response = gets.chomp
#binding.pry
  if (1..9).include?(response.to_i)
    #binding.pry
    puts "Playing #{songs[response.to_i-1]}"
  elsif songs[0..8].include?(response)
    puts "Playing #{response}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  response1 = gets.chomp

  if response1 == "exit"
    exit_jukebox
  elsif response1 == "list"
    list(songs)
    puts "What song would you like to play?"
    response2 = gets.chomp
  elsif response1 == "play"
    play(songs)
  elsif response1 == "help"
    help
    until ["exit","list","play","help"].include?(response1)
      help
      puts "What would you like to do?"
      response1 = gets.chomp
    end
    puts "What would you like to do?"
    response1 = gets.chomp
  else
    until ["exit","list","play","help"].include?(response1)
      puts "Sorry, invalid command."
      help
      puts "What would you like to do?"
      response1 = gets.chomp
    end
  end
end
