require('pg')
require('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Alabama 3"})
artist2 = Artist.new({"name" => "Johhny Cash"})
artist3 = Artist.new({"name" => "The Pogues"})
artist4 = Artist.new({"name" => "Motorhead"})
artist1.save()
artist2.save()
artist3.save()
artist4.save()



album1 = Album.new({
  "artist_id" => artist1.id,
  "title" => "Exile on Coldharbour Lane",
  "genre" => "Alternative"
})

album2 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Fumsom Prison",
  "genre" => "Rock and Roll"
})

album3 = Album.new({
  "artist_id" => artist3.id,
  "title" => "Rum, Sodomy & the Lash",
  "genre" => "Celtic Punk"
})

album4 = Album.new({
  "artist_id" => artist3.id,
  "title" => "Should I fall from grace of God",
  "genre" => "Celtic Punk"
})

album5 = Album.new({
  "artist_id" => artist4.id,
  "title" => "Ace of Spades",
  "genre" => "Rock"
})

album6 = Album.new({
  "artist_id" => artist4.id,
  "title" => "Overkill",
  "genre" => "Rock"
})

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()


# binding.pry

# p Artist.all()
artist_list = Artist.all
  artist_list.each do |hash|
  p hash.name
  end

  album_list = Album.all
    album_list.each do |hash|
    p " #{hash.title} ALBUM & #{hash.id}"
    end

nil
