require_relative ("../models/tag.rb")
require_relative ("../models/merchant.rb")

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
