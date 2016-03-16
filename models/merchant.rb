require_relative ('../db/sql_runner.rb')

class Merchant

  attr_reader(:name, :id)

  def initialize(options)
    @name = options['name']
    @id = options['id'] 
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.execute( sql )
    return merchants.map { |merchant| Merchant.new( merchant ) }
  end

  def self.create( options )
    sql = "INSERT INTO merchants (name) 
    VALUES (
    '#{ options['name'] }' )"
    SqlRunner.execute( sql )
    return Merchant.new( Merchant.last_entry() )
  end

  def self.last_entry
    sql = "SELECT * FROM merchants ORDER BY id DESC limit 1;"
    return SqlRunner.execute( sql ).first()
  end

  def self.delete_all 
    sql = "DELETE FROM merchants"
    SqlRunner.execute( sql )
  end
end