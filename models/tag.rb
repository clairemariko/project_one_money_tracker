require_relative ('../db/sql_runner.rb')

class Tag

  attr_reader(:name, :id)

  def initialize(options)
    @name = options ['name']
    @id = options ['id'] 
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.execute( sql )
    return tags.map { |tag| Tag.new( tag ) }
  end

  def self.create( options )
    sql = "INSERT INTO tags (name) VALUES ( '#{ options['name'] }' )"
    SqlRunner.execute( sql )
    return Tag.new( Tag.last_entry() )
  end

  def self.last_entry
    sql = "SELECT * FROM tags ORDER BY id DESC limit 1;"
    return SqlRunner.execute( sql ).first()
  end

  def self.delete_all 
    sql = "DELETE FROM tags"
    SqlRunner.execute( sql )
  end
end