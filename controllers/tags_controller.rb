require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")

get '/tags' do
@tags = Tag.all()
erb(:"tags/index")
end

post '/tags' do
  merchant = Tag.new(params)
  merchant.save

  if params["url"] == nil
    redirect to "/transactions"
  else
    redirect to params["url"]
  end

end
