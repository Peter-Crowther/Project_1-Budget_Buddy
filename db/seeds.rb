require_relative ("../models/tag.rb")
require_relative ("../models/merchant.rb")
require_relative ("../models/transaction.rb")
require("pry-byebug")

tag1 = Tag.new({
  "name" => "Food"
  })
tag1.save()

tag2 = Tag.new({
  "name" => "Clothes"
  })
tag2.save()

merchant1 = Merchant.new({
  "name" => "Tesco"
  })
  merchant1.save()

merchant2 = Merchant.new({
  "name" => "Next"
  })
  merchant2.save()

transaction1 = Transaction.new({
  "amount" => 25,
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
  })
  transaction1.save()

transaction2 = Transaction.new({
  "amount" => 45,
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
  })
  transaction2.save()

binding.pry
nil
