class Account

  attr_reader( :transactions, :merchants, :tags)

  def initialize(options)
    @transactions = options["transactions"]
    @merchants = options["merchants"]
    @tags = options["tags"]
  end


  def list_merchants
   return @merchants.map{ |merchant| merchant.name }
  end


  def list_tags
    return @tags.map{ |tag| tag.name }
  end


  def transaction_data(id)
      return @transactions.select { |transaction|  transaction.id == id }
      # @transactions.each do |transaction | if transaction.id == id
      #    return transaction
      # end
    end
  

  def list_transactions
    return @transactions.map { |transaction| transaction.value.to_f }
  end

  def total_transactions()
    return list_transactions.inject(0){ |sum, value | sum + value }
  end

end