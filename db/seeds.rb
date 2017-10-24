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

merchant3 = Merchant.new({
  "name" => "M&S"
  })
merchant3.save()

transaction1 = Transaction.new({
  "amount" => 25,
  "month" => "May",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
  })
  transaction1.save()

transaction2 = Transaction.new({
  "amount" => 45,
  "month" => "October",
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
  })
  transaction2.save()

transaction3 = Transaction.new({
  "amount" => 20,
  "month" => "October",
  "merchant_id" => merchant3.id,
  "tag_id" => tag2.id
  })
  transaction3.save()


binding.pry
nil
