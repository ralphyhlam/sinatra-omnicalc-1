require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)  
end

get("/square/new") do 
  erb(:square)
end

get("/square/results") do
  @input = params.fetch("number").to_f
  @squared = @input ** (2)

  erb(:square_results)
end

get("/square_root/new") do
  erb(:squareroot)
end

get("/squareroot/results") do
  @input = params.fetch("user_number").to_f
  @rooted = @input ** (0.5)

  erb(:squareroot_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @random_minimum = params.fetch("minimum").to_f
  @random_maximum = params.fetch("maximum").to_f

  @output = rand(@random_minimum..@random_maximum).to_fs

  erb(:random_results)

end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do 
  @input_apr = params.fetch("user_apr").to_f
  @format_apr = @input_apr.to_fs(:percentage, {:precision => 4})

  calc_apr = ((@input_apr) / (100)) / 12
  
  @input_period = params.fetch("user_years").to_i
  calc_period = (@input_period) * (12)

  @input_principal = params.fetch("user_principal").to_f
  @format_principal = @input_principal.to_fs(:currency)

  numerator = calc_apr * (@input_principal)
  @denominator = 1 - ((1 + calc_apr)**(-1 * calc_period))

  @payment = (numerator/@denominator).to_fs(:currency)

  erb(:payment_results)
end
