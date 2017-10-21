require_relative("../db/sql_runner.rb")

class Tag
attr_accessor (:tag_name)
attr_reader (:id)

def initialize(options)
  @id = options["id"].to_i()
  @tag_name = options["tag_name"]



end
