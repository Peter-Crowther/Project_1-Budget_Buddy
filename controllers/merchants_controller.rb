require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/merchant.rb")

get '/merchants' do
@merchants = Merchant.all
erb(:"merchants/index")
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save

  if params["url"] == nil
    redirect to "/transactions"
  else
    redirect to params["url"]
  end

end
