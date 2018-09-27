require('pg')
require('pry')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def albums()
    # take the artist
    sql = "
    SELECT title FROM albums
    WHERE artist_id = $1;
    "
    results = SqlRunner.run(sql,[@id])
    albums = results.map do |album_hash|
      Album.new(album_hash)
    end
    # album_object = results[0]
    # albums = Album.new(album_object)
    return albums
    # return a list of all albums by that artist
  end

  def save()
    sql = "
      INSERT INTO artists (name)
      VALUES($1)
      RETURNING id;
    "
    values = [@name]
    result = SqlRunner.run(sql, values)
    result_hash = result[0]
    id = result_hash['id'].to_i()
    @id = id
  end

  def self.all()
    sql = "
      SELECT * FROM artists;
    "
    artist_hashes = SqlRunner.run(sql)
    artist_objects = artist_hashes.map do |artist_hash|
        Artist.new(artist_hash)
      end

    return artist_objects
  end

  def self.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

end
