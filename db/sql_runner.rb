require( 'pg' )

class SqlRunner

  def self.execute( sql )
    begin
      db = PG.connect({ dbname: 'money_tracker', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end