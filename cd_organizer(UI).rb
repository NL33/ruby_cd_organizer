require './lib/cd'

def main_menu
  puts "Press 'a' to add a CD. Press 'l' to list all CDs. 
        Press 's' to search your collection by album name or artist name. Press 'x' to exit"
  user_choice = gets.chomp.to_s
  case user_choice
  when 'a'
    add_cd
  when 'l'
    list_cds
  when 's'
    search_cds
  when 'x'
    exit
  else
    puts "Please enter a valid option"
  end
end

  def add_cd
    puts "please enter the name of the CD you want to add"
    album_input = gets.chomp.to_s
    puts "please enter the artist"
    artist_input = gets.chomp.to_s
    album_input = CD.new(album_input, artist_input)
    album_input.save
    puts "#{album_input} has been added to your collection"
    puts "press 'e' to enter a new CD, or 'm' to return to the main menu"
      if gets.chomp == 'e'
          add_cd
      elsif gets.chomp == main_menu
          main_menu
      else 
          puts "Please enter a valid selection"
      end
  end

  def list_cds
    CD.all.each do |cd|
      puts "#{cd.album}: #{cd.artist}"
    end
    puts "Press 'm' to return to the main menu."
     if gets.chomp == 'm'
        main_menu
     else
        puts "please enter a valid selection"
    end
  end

def search_cds
  puts "Press 'c' to search by album name or 'a' to search by artist name"
  if gets.chomp = c
  puts "Enter the name of the album you are searching for"
  searched_for_cd = gets.chomp.to_s
    if CD.search(searched_for_cd) == "match"
    puts "#{cd.album}: #{cd.artist}"
    puts "Press 's' to search again, or 'm' to return to the main menu."
      if gets.chomp == 's'
          search_cds
      elsif gets.chomp == 'm'
          main_menu
      else 
          puts "Please enter a valid selection"
      end
    elsif cd.search(searched_for_cd) == "no match"
    puts "No match. Press 's' to search again, or 'm' to return to the main menu."
       if gets.chomp == 's'
          search_cds
      elsif gets.chomp == 'm'
          main_menu
      else 
          puts "Please enter a valid selection"
      end
  end
  elsif gets.chomp = a
  puts "Enter the name of the artist you are searching for"
  searched_for_artist = gets.chomp.to_s
  puts "The #{searched_for_artist} has the following CDs in your collection:"
  CD.search_by_artist(searched_for_artist) 
    puts "Press 's' to search again, or 'm' to return to the main menu."
      if gets.chomp == 's'
          search_cds
      elsif gets.chomp == 'm'
          main_menu
      else 
          puts "Please enter a valid selection"
      end
end



