require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/transactions_controller.rb")

get "/" do
erb(:index)
end
