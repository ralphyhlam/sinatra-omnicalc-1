require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)  
end

get("/square/new") do 
  erb(:square)
end

get("/square/results") do
  @input = params.fetch("number").to_i
  @squared = @input ** (2)

  erb(:square_results)
end

get("/square_root/new") do
  erb(:squareroot)
end

get("/squareroot/results") do
  @input = params.fetch("user_number").to_i
  @rooted = @input ** (1/2)

  erb(:squareroot_results)
end
