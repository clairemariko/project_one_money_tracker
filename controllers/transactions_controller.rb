require( 'sinatra' )
require( 'sinatra/contrib/all' )
require ('date')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

require( 'pry-byebug' )

# INDEX ACTION
get( '/transactions' ) do 
  @transactions = Transaction.all()
  erb( :"transactions/index" )
end

# NEW ACTION
get( '/transactions/new' ) do 
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb( :"transactions/new" )
end

# CREATE/SAVE ACTION
post( '/transactions' ) do 
  Transaction.create( params )
  redirect( to( '/account' ) )
end


#SEARCHING BY TAG



#SHOW A WHOLE TRANSACTION
# get( '/transactions/:id' ) do 
#   @transactions = Transaction.find(params[:id])
  
#   erb (:"transactions/show")
# end

# EDIT WHOLE TRANSACTION
get('/transactions/:id/edit') do
  @tags = Tag.all
  @merchants = Merchant.all
  @transaction = Transaction.find(params[:id])
  erb( :"transactions/edit" )
end

#DELETE A WHOLE TRANSACTION
post ( '/transactions/:id/delete' ) do
  @transaction = Transaction.find(params[:id])
  @transaction.delete
redirect(to('/account') )
end

#UPDATE WHOLE TRANSACTION
post( '/transactions/:id') do

  @transaction = Transaction.new( params )
  @transaction.update()
  redirect( to( '/account' ) )
  # redirect to("/transactions/#{params['transaction_id']}")
end






