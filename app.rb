require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/transactions_controller.rb")
require_relative("./controllers/tags_controller.rb")
require_relative("./controllers/merchants_controller.rb")


get '/' do
  @transactions = Transaction.all
  @total = Transaction.total
  @budget = 400
  erb(:index)
end
