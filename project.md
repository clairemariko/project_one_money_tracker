SEARCH FUNCTION 



Making a search function :
Start with the index page and make a search drop down menu. i can make just a text box but here i want to limit the user input. as in they may miss spell and break my code. 

<form method="get" action="/account">
  
  <label for="tag_id">Search by Tag:</label>
  <select name="search">
    <% @tags.each do |tag| %>
      <option value="<%= tag.id %>"><%= tag.name %></option>
    <% end %>
  </select>
  <button>search</button>
</form>

The method is a GET as we are getting information from the browser. 
Like in new.erb we follow the same format of making a drop down. Give it a label and make sure it is assigned the same name "for=tag_id"

The select: the name well in this case is just "Search" and we are lopping through all of our tags and bring us each individual tag we have made. 
Now what we want to send to our programme is the id but this isnt very user friendly. A user wont know what 24 is but they would know what is 'food'. 


Ok check that at least it is appearing in the bowser. 

Now to set up the method in your .rb file. 

This is where we write a method for it to access our database and searching for the info we have GOT from the browser. 


'''def self.search(tag_id)

  sql = "SELECT * FROM transactions WHERE tag_id = #{tag_id}"
  search_result = SqlRunner.execute( sql )
  result = search_result.map { |transaction| Transaction.new(transaction) }
 return result'''

Where are we searching ? we are searching in the transaction table and we are looking for particular tags.
This search_result is assigned to information coming from our database. 
so now we have this big row of info from our transaction table. but we want to go through this and find the exact transaction that matches the i.d .
So we MAP through our 'search-result' which remember is = to all that info from our database.
The map, indidualises all the transactions and then we return the result. 


Now to the controller!
We do an if/else statement for our search method so in the situation where the user doesnt input anything then it will show all the accounts but 
IF they do input something and this will be the params[:search] is a value to one of the transactions then show it. 



Notes from revision with Rick. 











