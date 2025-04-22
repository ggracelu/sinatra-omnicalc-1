require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @num = params.fetch("number")
  @num_squared = @num.to_f ** 2
  erb(:square_results)
end

get("/squar_root/new") do
  
end
