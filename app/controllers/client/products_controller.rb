class Client::ProductsController < ApplicationController


  def index 
    responce = HTTP.get("http://localhost:3000/api/products")
    @products = responce.parse
    render 'index.html.erb'
  end
end
