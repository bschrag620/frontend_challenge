class OrdersController < ApplicationController
  def new
    order = Order.new
    render Views::Orders::New.new(order: order)
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

  def order_params
    params.require(:order).permit(entree_ids: [], appetizer_ids: [], dessert_ids: [])
  end
end