require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

get "/" do
  @restaurants = Restaurant.all
  # @view.display(restaurants)
  erb :index
end

get "/restaurants/:id" do
  puts ""
  puts "params id is #{params[:id]}"
  puts ""
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post "/restaurants" do
 @restaurant = Restaurant.new(
                name: params[:name],
                address: params[:address]
               )
 @restaurant.save
 redirect "/restaurants/#{@restaurant.id}"
end


