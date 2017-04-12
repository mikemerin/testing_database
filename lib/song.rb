class Song

  attr_accessor :name, :album
  attr_reader :id

  def initialize(collect = {})
    @name = collect['name']
    @album = collect['album']
    @id = collect['id']
  end

  def self.create_table

    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT )
    SQL

    DB[:conn].execute(sql)

  end

  def self.all
    sql = <<-SQL
      SELECT * FROM songs
    SQL
    DB[:conn].execute(sql).collect { |data| self.new(data) }
  end

  def save
    sql = <<-SQL
      INSERT INTO songs (name, album) VALUES (?, ?);
    SQL

    DB[:conn].execute(sql, self.name, self.album)

    @id = DB[:conn].execute("SELECT * FROM songs").first[0]

    self

  end

end

# class Song
#
#   attr_accessor :name, :album
#   attr_reader :id
#
#   def initialize(collect = {})
#     @name = collect['name']
#     @album = collect['album']
#     @id = collect['id']
#   end
#
#   def self.create_table
#
#     sql = <<-SQL
#       CREATE TABLE IF NOT EXISTS songs (
#         id INTEGER PRIMARY KEY,
#         name TEXT,
#         album TEXT )
#     SQL
#
#     DB[:conn].execute(sql)
#
#   end
#
#   def self.all
#     sql = <<-SQL
#       SELECT * FROM songs
#     SQL
#     DB[:conn].execute(sql).collect { |data| self.new(data) }
#   end
#
#   def save
#     sql = <<-SQL
#       INSERT INTO songs (name, album) VALUES (?, ?);
#     SQL
#
#     DB[:conn].execute(sql, self.name, self.album)
#
#     @id = DB[:conn].execute("SELECT * FROM songs").first[0]
#
#     self
#
#   end
#
# end
