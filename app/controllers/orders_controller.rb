class OrdersController < ApplicationController
  def new
    order = Order.new
    render Views::Orders::New.new(order: order)
  end

  def show
    @order = Order.find(params[:id])
    render Views::Orders::Show.new(order: @order)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to [@order]
    else
      render turbo_stream: turbo_stream.replace(
        'order-form',
        partial: 'form',
        locals: {
          order: @order,
          search_value: params[:search_value]
        }
      )
    end
  end

  def search_form
    render turbo_stream: turbo_stream.replace(
      'order-form',
      partial: 'form',
      locals: {
        order: Order.new(order_params),
        search_value: params[:search_value]
      }
    )
  end

  def preview_form
    render turbo_stream: turbo_stream.replace(
      'order-preview',
      partial: 'preview',
      locals: {
        order: Order.new(order_params)
      }
    )
  end

  def order_params
    params.require(:order).permit(entree_ids: [], appetizer_ids: [], dessert_ids: []) rescue {}
  end
end