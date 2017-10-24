require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")

get '/transactions' do
@transactions = Transaction.all
@total = Transaction.total
@merchants = Merchant.all
@tags = Tag.all
erb(:"transactions/index")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params["id"])
  erb(:"transactions/update")
end

post '/transactions/:id' do
  Transacton.update(params[:id])
  redirect to("/transactions")
end
