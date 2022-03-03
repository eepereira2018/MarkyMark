class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def dcookies
    @_request.reset_session
    redirect_to root_path
  end
  
  def cart
    @products = Product.find(session[:cart])
  end

  def show
    
    @product = Product.find(params[:id])
    
  end


def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)

  if @product.save
    redirect_to @product
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])

  if @product.update(product_params)
    redirect_to @product
  else
    render :edit, status: :unprocessable_entity
  end
end

def put_in_cart
  @product = Product.find(params[:id])
  cart = session[:cart] || []
  cart << @product.id
  session[:cart] = cart
  redirect_to root_path
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy

  redirect_to root_path, status: :see_other
end

private
    def product_params
      params.require(:product).permit(:title, :description, :cost, :image, :status)
    end
  end

