class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end
  
  def create
    product = Product.find_by(id: params[:product_id])
    calc_subtotal = product.price * params[:quantity].to_i
    calc_tax = calc_subtotal * 0.09
    calc_total = calc_subtotal + calc_tax
    @order = Order.new(
      quantity: params[:quantity],
      product_id: params[:product_id],
      user_id: current_user.id,
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total
    )
    # calc_subtotal = @order.product.price * @order.quantity
    # calc_tax = calc_subtotal * 0.09
    # calc_total = calc_subtotal + calc_tax
    # @order.subtotal = calc_subtotal
    # @order.tax = calc_tax
    # @order.total = calc_total
    if @order.save
      render "show.json.jb"
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
    render "show.json.jb"
  end

end
