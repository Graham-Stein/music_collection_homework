require('pg')
require('pry')

class Album

  attr_reader :id #, :artist
  attr_accessor :title, :genre

  def initialize(options)
    @id = options["id"].to_i()
    @artist_id = options["artist_id"].to_i()
    @title = options["title"]
    @genre = options["genre"]
  end


  def save()
    sql = "
      INSERT INTO albums (
        artist_id,
        title,
        genre
      )
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [
      @artist_id,
      @title,
      @genre
    ]
    result = SqlRunner.run(sql, values)
    result_hash = result[0]
    id = result_hash['id'].to_i()
    @id = id
  end

  def self.all()
    sql = "
      SELECT * FROM albums;
    "
    album_hashes = SqlRunner.run(sql)
    album_objects = album_hashes.map do |album_hash|
        Album.new(album_hash)
      end

    return album_objects
  end

  def self.delete_all()
    sql = 'DELETE FROM albums;'
    SqlRunner.run(sql)
  end

end
