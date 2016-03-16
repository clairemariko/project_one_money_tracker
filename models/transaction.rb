require( 'date' )
require_relative ('../db/sql_runner.rb')
require( 'pry-byebug' )

class Transaction

  attr_reader(:id, :tag_id, :merchant_id, :value, :transaction_date)

  def initialize( options )
    @id = options['id'] 
    @tag_id = options['tag_id']
    @merchant_id = options['merchant_id']
    @value = options['value']
    @transaction_date = options ['transaction_date']
  end

    def merchant
      sql = "SELECT * FROM merchants WHERE id=#{@merchant_id}"
      merchant = SqlRunner.execute( sql )
      return Merchant.new( merchant[0] )
    end

    def tag
      sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
      tag = SqlRunner.execute(sql)
      return Tag.new(tag[0])
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      transactions = SqlRunner.execute( sql )
      return transactions.map { |transaction| Transaction.new( transaction ) }
    end

    def self.create( options )
      sql = "INSERT INTO transactions (
              tag_id,
              merchant_id,
              value, 
              transaction_date) 
            VALUES (
              #{options['tag_id']}, 
              #{options['merchant_id']},
              #{options['value']}, 
              '#{options['transaction_date']}' )"
      SqlRunner.execute( sql )
      return Transaction.new( Transaction.last_entry() )
    end


    def self.search(tag_id)
    
      sql = "SELECT * FROM transactions WHERE tag_id = #{tag_id}"
      search_result = SqlRunner.execute( sql )
      result = search_result.map { |transaction| Transaction.new(transaction) }
     return result
  
      #not sure how to end this
    end


#FINDING A TRANSACTION,MERCHANT,TAG
    def self.find(id)
      sql = "SELECT * FROM transactions WHERE id = #{id}"
      result = SqlRunner.execute(sql)
      transaction = Transaction.new(result[0])
    end

    def update()
      sql = "UPDATE transactions SET tag_id='#{ tag_id }', merchant_id='#{ merchant_id }' WHERE id = #{id}"
        SqlRunner.execute(sql)
    end

    def delete()
      sql = "DELETE FROM transactions WHERE id = #{id}"
          SqlRunner.execute(sql)
      end
    # def merchants()
    #   sql = "SELECT * FROM merchants WHERE transaction_id = #{@id}"
    #   merchants = Transaction.execute(sql)
    #   result = merchants.map{ |merchant| Merchant.new(merchant)}
    # end

    # def tags()
    #   sql = "SELECT * FROM tags WHERE tag_id = #{@id}"
    #   tags = Transaction.execute(sql)
    #   result = tags.map{ |tag| Tag.new(tag)}
    # end






    def self.last_entry
      sql = "SELECT * FROM transactions ORDER BY id DESC limit 1;"
      return SqlRunner.execute( sql ).first()
    end

    def self.delete_all
      sql = "DELETE FROM transactions"
      SqlRunner.execute( sql )
    end

  end



    