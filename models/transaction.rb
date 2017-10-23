require_relative("../db/sql_runner.rb")

class Transaction
  attr_reader(:id)
  attr_accessor(:amount, :merchant_id, :tag_id)

  def initialize(options)
    @id = options["id"].to_i()
    @amount = options["amount"].to_i()
    @merchant_id = options["merchant_id"].to_i()
    @tag_id = options["tag_id"].to_i()
  end

  def save()
    sql = "INSERT INTO transactions (amount, merchant_id, tag_id)
    VALUES ( $1, $2, $3)
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map{|transaction|Transaction.new(transaction)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
          WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results.first)
  end

  def merchant()
    sql = "SELECT * FROM merchants
          WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end
  def tag()
    sql = "SELECT * FROM tags
          WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def update()
    sql = "UPDATE transactions
          SET ( amount, merchant_id, tag_id) = ($1, $2, $3)
          WHERE id = $4"
    values = [@amount, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions
            WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def total()
    sql = "SELECT SUM(amount) FROM transactions"
    values [@amount]
    results = SqlRunner.run(sql, values)
    return results.first()["SUM"].to_f

  end



end
