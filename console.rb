require('pg')
require('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

# Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({"name" => "Alabama 3"})
artist1.save()


album1 = Album.new({
  "artist_id" => artist1.id,
  "title" => "Exile on Coldharbour Lane",
  "genre" => "Alternative"
})
album1.save()


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
