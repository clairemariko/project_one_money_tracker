class Account

  attr_reader( :transaction, :merchant, :tag)

  def initialize(options)
    @transaction = options["transaction"]
    @merchant = options["merchant"]
    @tag = options["tag"]
    


  end

  def list_merchants
   return @merchant.map{ |merchant| merchant.name }
  end

  def list_tags
    return @tag.map{ |tag| tag.name }
  end

  def transaction_data(id)
     @transaction.each do |transaction | 
      if transaction.id == id
         return transaction
      end
    end
  end

  def list_transactions
    return @transaction.map { |transaction| transaction.value }
  end


  def total_transactions()
    return list_transactions.inject { |sum, transactions | sum + transactions }
  end





  

  

end