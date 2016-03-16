require('sinatra')
require('pry-byebug')
require('sinatra/contrib/all')
require ('date')
require_relative('../models/tag.rb')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')


get '/account' do 

  if params[:search]
      @account = Account.new( { 
      'transactions' => Transaction.search(params[:search]),
      'tags' => Tag.all(),
      'merchants' => Merchant.all()
    } )
      @tags=Tag.all
      
  else 
    @account = Account.new( { 
    'transactions' => Transaction.all(),
    'tags' => Tag.all(),
    'merchants' => Merchant.all()
  } )
    @tags=Tag.all
  end
  erb( :"accounts/index" )

end




# get '/account' do
#  options = {
#   'tags' => Tag.all,
#   'accounts' => Account.all,
#   'transactions' => Transaction.all }

#   @account = Account.new(options)
#   erb :"accounts/index"
# end






#   get '/accounts/new' do
#     @tags = Tag.all
#     @transctions = Transactions.all
#     @merchants = Merchnats.all
#     erb :"accounts/new"
#   end

#   @account = Account.new(options)
#   erb :"account/index"
#   end

#   post '/transations' do
#     @account = Account.new(options)
#     @account.save()
#   end

