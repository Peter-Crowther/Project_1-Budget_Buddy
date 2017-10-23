require_relative("../db/sql_runner.rb")

class Tag
  attr_accessor (:name)
  attr_reader (:id)

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO tags (name)
            VALUES ($1)
            RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM tags"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|tag|Tag.new(tag)}
  end

  def self.find(id)
    sql = "SELECT * FROM tags
          WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end


end
