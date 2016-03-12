require('minitest/autorun')
require_relative('../models/account.rb')
require_relative('../models/transactions.rb')
require_relative('../models/merchants.rb')
require_relative('../models/tags.rb')


class TestAccount < Minitest::Test


  def setup
    @tag1 = Tag.new ({'name'=> "food", 'id'=> 1})
    @tag2 = Tag.new ({'name' => "clothes", 'id' => 2})
    @tag3 = Tag.new ({'name' => "books", 'id' => 3})

    @tags=[@tag1, @tag2, @tag3]


    @merchant1 = Merchant.new({ 'name' => "tesco", 'id' => 1})
    @merchant2 = Merchant.new({'name' => "zara", 'id' => 2})
    @merchant3 = Merchant.new({'name' => "waterstone", 'id' => 3})

    @merchants = [@merchant1, @merchant2, @merchant3]


    @transaction1 = Transaction.new({'value' => 20, 'date' => 15, 'id' => 1})
    @transaction2 = Transaction.new({'value' => 10, 'date' => 17, 'id' => 2})

    @transactions = [@transaction1, @transaction2]


    options = {'tag' => @tags,
              'merchant' => @merchants,
              'transaction' => @transactions, 
              }

    @accounts = Account.new(options)
  end


  def test_list_merchants()
    result = @accounts.list_merchants()
    assert_equal(["tesco", "zara", "waterstone"], result)
  end

  def test_list_tags()
    result = @accounts.list_tags()
    assert_equal(["food", "clothes", "books"], result)
  end

  def test_transaction_data
   result = @accounts.transaction_data(1)
    assert_equal(@transaction1, result)
  end

 def test_list_transactions
  result = @accounts.list_transactions()
  assert_equal([20, 10], result)
 end

 def test_total_transactions()
  result = @accounts.list_transactions(transaction.value)
  assert_equal(30, result)
 end

 


end