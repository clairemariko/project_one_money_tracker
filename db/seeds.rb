require_relative('../modles/merchants')
require_relative('../modles/tags')
require_relative('../modles/transactions')

require('pry-byebug')

Merchant.delete_all
Tag.delete_all
Transaction.delete_all


merchant1 = Merchant.create({'name' => "asda"})
merchant2 = Merchant.create({'name' => "tesco"})
merchant3 = Merchant.create({'name' => "topshop"})

tag1 = Tag({'name' => "food"})
tag2 = Tag({'name' => "clothes"})
tag3 = Tag({ 'name' => "topshop"})

transaction = Transaction.create({
              'merchant_id' => merchant1.id,
              'tag_id' => tag2.id,
              'value' => 10





  })

