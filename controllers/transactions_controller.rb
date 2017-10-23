require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")

get '/transactions' do
@transactions = Transaction.all
@total = Transaction.total
erb(:"transactions/index")
end
