What were my initial goals:


What have i just learnt with Rick


So I picked two controllers, as the account controller is going be my view it will have no sql it is just pure logic and it is what the user will see. My transaction controller is going to be another view for the user but it does all speak to my data base. 

Database


Routes: I was like yay, my database works and all the info is populating my table correctly. so routes yeah that should be a breeze cus it just minpulating the information i have..... nope nope nope
I learnt that even though I understood the logic behind them, when it came to writting it, i would find myself having codders block and then enter a dark dark hole. 
Tag.name
.name is an instance of my object tag which i have avaliable. for example if i had several options such as location, name, size. The tag represents all this information. by putting .name im saying ok you have the row of information but i just want the name. 

get( '/transactions' ) do 
  @transactions = Transaction.all()
  erb( :"transactions/index" )
end

GET: because my database already holds information im saying "go GET my info"
@transactions = Transactions.all()  bring back all my information from my modle transaction and we have access to this through @transactions. 

erb( :"transactions/index" )
now i have GOT all my info, you can view it in my index.erb so go there when you hit this line.

THE INDEX

<% @transactions.each do |transaction| %>
  <tr>
    <td><%= transaction.transaction_date %></td>
    <td><%= transaction.merchant.name %></td>
    <td><%= transaction.tag.name %></td>
    <td><%= transaction.value %></td>

  <% @transactions.each do |transaction| %> With all my transactions in my database go ane make them indiduals in their own right. 
  <td><%= transaction.transaction_date %></td> i have date as an option within the transaction modle. there i can .transaction_date. it is IMPORTANT that these are the same "name" as the "named" options in my modles. hence why i cant just write .date as in my modle it is called transaction_date. 

  <td><%= transaction.merchant.name %></td> This is saying that for the method MERCHANT which i made in my transaction modle. it can do transaction.merchant. At this point it goes and finds the method 'merchant' and runs the method. 
  def merchant
    sql = "SELECT * FROM merchants WHERE id=#{@merchant_id}"
    merchant = SqlRunner.execute( sql )
    return Merchant.new( merchant[0] )
  end

  The method: sql = "SELECT * FROM merchants WHERE id=#{@merchant_id}"  im giving it acess to my database, and im wanting a all the information from this table 'merchant'. 
  merchant = SqlRunner.execute( sql ) now i have a row of information from the table I created, which is just name and id. set this row of information to merchant.  

  return Merchant.new( merchant[0] ) 
  the row of information is now contained in [] and this is set to a new instance of merchant. 
  in this case i only have name, so the only thing in my [] is name. 

  but what if i also had location, phonenumber.... then yes this will also be in [] 

  transaction.merchant.name so I have a box of the information of the row from my table merchant but i know i only need the name. so like how i could call transaction.merchant, im getting access into my merchant table, i can then funnel down further and say well in my merchant modle i just want the name. 

  to just continure my explaination, what if i had a modle name and this held the information such as origin then you could go further you could have 
  transaction.merchant.name.origin
  as long as have made a method for it to have access to the name table. 



  My next route

  get( '/transactions/new' ) do 
    @merchants = Merchant.all()
    @tags = Tag.all()
    erb( :"transactions/new" )
  end

  So before I could show my database that I have already populated. but i want to be able to add stuff to it. 
  We use GET as we are saying GET the new information. 
  What will this new information hold: well it will hold a merchant and a tag. so we must give it access to these.
  @merchants = Merchant.all()
  @tags = Tag.all()
  so we have specified what this new information is going to contain how will we view this inforamtion ?


  erb( :"transactions/new" )

  we will view it is a new.erb and now we have to setup this file to show what we want the user to see and what information is going to be sent back 

  This is one of my biggest blockers I had. 
  <label for="merchant_id">Merchant:</label>
  <select name="merchant_id">
    <% @merchants.each do |merchant| %>
      <option value="<%= merchant.id %>"><%= merchant.name %></option>
    <% end %>
  </select><br><br>


  I know the user is going to select a merchant which is at the moment just a name. so we need to make that by selecting a name it is assigning it to merchant_id. 
  therefore we make, name to equal "merchant_id" which is available to us through out transaction modle. but this modle need to speak to merchant and know what it is doing with this information. 

  ```<% @merchants.each do |merchant| %>```
  We are asking it on this line to bring back the merchants but then individualise each singular merchant. 
  ```<option value="<%= merchant.id %>"><%= merchant.name %></option>```
option value allows us to have a drop down of selections, it is giving us the merchants that i have had coded in my seed to populate my database. before worrying about name we want to make sure that the option we select is giving us an i.d this is where prybye bug comes in handy and it will give us a hash which would show merchant_id =12. 

Therefore if were to go in our index at this stage the Merchant coloumn will show lots of ids. For a user this isnt very useful that have no idea what this number means. This is where i got stuck. how i can i make it bring back the name the id is set too...

<%= merchant.name %> By yeilding in merchant.name is will asigin the merchant.id to a name and this is what the use will see. 

Now i have already made a method for merchant, remember in your index root. 

def merchant
  sql = "SELECT * FROM merchants WHERE id=#{@merchant_id}"
  merchant = SqlRunner.execute( sql )
  return Merchant.new( merchant[0] )
end


OK we have got some new information but now we need to create/save it. or otherwise it going to be floating around and not be adding to our index. 

post( '/transactions' ) do 
  Transaction.create( params )
  redirect( to( '/transactions' ) )
end

with this new inforamtion we have GOT we not want to POST it to our index. 

Transaction.create( params )

transaction.create is a method we havn't made yet but we will get back to that first explain the 'params'

At first i thought surely it should be options...no as params is the browser version of options. we are saying here the info that has been in putted in our browser contains these params. 

now to make the method for .create

``` def self.create( options )
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
    end```

    With the New information we have just GOT we are now posting it into our table TRANSACTIONS. it is setting the new information in and saving it. 

    return Transaction.new( Transaction.last_entry() )
    So we want to return this new transaction as the last entry of our table. you could put it up at the start but that doesnt make sence any sence for me. 

    redirect( to( '/transactions' ) )
    I have redirect it instead of making a create.erb as I want the user to go to the index to see it added on to their list. 

    












