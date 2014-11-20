class CD

@@all_cds = []

def CD.all
	@@all_cds
end

attr_reader(:album, :artist)  #equivalent to def artist/@artist, and def album/@album

def initialize(album, artist)
  @album = album
  @artist = artist
end

def save
  @@all_cds << self
end

 def CD.search(cd_entry) #for searching by album name
    CD.all.each do |cd|
      result = cd.album
      if result == cd_entry
      	return "match"
      else 
      	return "no match"
      end
    end 
  end 
  #note another way of handling this loop (above, more cumbersome method remains for instructive purposes: 
    #matching_cd = @@all_cds.select {|cd| cd.album[0] == title}
    #matching_cd

 def CD.search_by_artist(artist) #for searching by artist name
	 matching_cd = CD.all.select {|cd| cd.artist == artist} #select returns an array of the items while excluding any for which value is false
	 matching_cd.each {|matching_item| puts "#{matching_item.album}: #{matching_item.artist}"}
 end

end

#the following code was used to evaluate some of the above code (it is not necessary, just for illustrative purposes)
The_Wall = CD.new("The Wall", "Pink Floyd")

puts The_Wall.artist  #returns "Pink Floyd"

The_Wall.save

Division_Bell = CD.new("Division Bell", "Pink Floyd")

Division_Bell.save

Hurry_Up_Were_Dreaming = CD.new("Hurry Up We're Dreaming", "M83")

Hurry_Up_Were_Dreaming.save

# puts CD.search("The Wall")  #returns match

CD.search_by_artist("Pink Floyd")  #returns:
#The Wall: Pink Floyd
#Division Bell: Pink Floyd
