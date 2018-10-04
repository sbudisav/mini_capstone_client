class Client::ProductsController < ApplicationController


  def index 
    responce = HTTP.get("http://localhost:3000/api/products")
    @products = responce.parse
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {name: params["name"],
                     price: params["price"],
                    image_url: params["image_url"],
                    description: params["description"],
                    stock: params["stock"],
                    supplier_id: params["supplier_id"]
                    }
    responce = HTTP.post("http://localhost:3000/api/products", form: client_params)

    @product = responce.parse
    redirect_to "/client/products/#{@product["id"]}"
  end

  def show
    responce = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = responce.parse
    render 'show.html.erb'
  end

  def edit 
    responce = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = responce.parse
    render 'edit.html.erb'
  end

  def update
    client_params = {
                      name: params[:name],
                      price: params[:price],
                      description: params[:description],
                      supplier_id: params[:supplier_id],
                      stock: params[:stock]
                    }

    response = HTTP.patch(
                          "http://localhost:3000/api/products/#{params[:id]}",
                          form: client_params
                          )

    @product = response.parse
    redirect_to "/client/products/#{@product["id"]}"
  end

  def destroy
    HTTP.delete("http://localhost:3000/api/products/#{params[:id]}")
    redirect_to "/client/products"
  end

end
