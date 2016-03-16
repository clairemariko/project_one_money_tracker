require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

require('pry-byebug')

Merchant.delete_all
Tag.delete_all
Transaction.delete_all


merchant1 = Merchant.create({'name' => "asda"})
merchant2 = Merchant.create({'name' => "h&m"})
merchant3 = Merchant.create({'name' => "lovecrumbs"})

tag1 = Tag.create({'name' => "food"})
tag2 = Tag.create({'name' => "clothes"})
tag3 = Tag.create({'name' => "coffee"})

transaction1 = Transaction.create({
          'merchant_id' => merchant1.id,
          'tag_id' => tag2.id,
          'value' => 10,
          'transaction_date' => '13 June 2015'
            })

transaction2 = Transaction.create({
          'merchant_id' => merchant2.id,
          'tag_id' => tag2.id,
          'value' => 30,
          'transaction_date' => '13 June 2015'
          })

transaction3 = Transaction.create({
          'merchant_id' => merchant3.id,
          'tag_id' => tag3.id,
          'value' =>20,
          'transaction_date' => '13 June 2015'
          })
nil











