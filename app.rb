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


get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @num = params.fetch("number").to_f
  @num_root = @num.to_f ** 0.5
  erb(:root_results)
end


get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @minimum = params.fetch("min").to_f
  @maximum = params.fetch("max").to_f
  @result = rand(@minimum..@maximum)
  erb(:random_results)
end


get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @r = (@apr/100)/12
  @years = params.fetch("yrs").to_i
  @months = @years * 12
  @principal = params.fetch("princ").to_f

  @numerator = @r * @principal
  @denominator = 1 - (1 + @r)**(-@months)

  @monthly_payment = @numerator/@denominator
  erb(:payment_results)
end
