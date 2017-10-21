require_relative ("../models/tag.rb")
require("pry-byebug")

tag1 = Tag.new({
  "name" => "Food"
  })

tag1.save()

tag2 = Tag.new({
  "name" => "Clothes"
  })

tag2.save()
