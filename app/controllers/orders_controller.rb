class OrdersController < ApplicationController

  def new
    @order = Order.new
    @tasks = Task.all
    3.times { @order.items.build }
  end

  def create
    @order =Order.new(order_params)
    if @order.save
      @order.items.build
      redirect_to orders_path
      #render plain: params[:order].inspect
    else
      render action: new
    end
  end

 def index
   @orders = Order.all
end
  def edit
    @order = Order.find(params[:id])
    @tasks =Task.all
   # @items = Item.find(order_id:params[:order_id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      redirect_to @order, notice: "Successfully updated survey."
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: "Successfully destroyed survey."
  end

  private

  def order_params
    params.require(:order).permit(:user_id, items_attributes: [:name, :description, :price, :hours,:line_total, :order_id])
  end

end

