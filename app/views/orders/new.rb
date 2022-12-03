module Views
  class Orders::New < Phlex::HTML
    include Phlex::Rails

    register_element(:turbo_frame)

    def initialize(order:, search_value: '', entrees: Entree.all, appetizers: Appetizer.all, desserts: Dessert.all)
      @order = order
      @entrees = entrees
      @appetizers = appetizers
      @desserts = desserts
      @search_value = search_value
    end

    def template
      div class: 'max-w-lg mx-auto mt-12' do
        h1(class: 'text-xl mb-2') { 'Frontend challenge!' }
        div(class: 'border border-gray-300 rounded p-6') do
          div(class: 'mb-4') do
            p(class: 'mb-1') { 'Select Course' }
            div do
              select(value: 'All courses', class: 'border border-gray-300 rounded p-2') do
                option(value: 'all') { 'All courses' }
                option(value: 'appetizers') { 'Appetizers' }
                option(value: 'entrees') { 'Entrees' }
                option(value: 'desserts') { 'Desserts' }
              end
            end
          end
          div(class: 'mb-8') do
            p(class: 'mb-1') { 'Search Items' }
            input type: 'text', value: @search_value, placeholder: 'Search Items', id: 'order-search', data: {controller: 'search'}, class: 'border border-gray-300 rounded p-2'
          end
          div(class: 'flex flex-row justify-between') do
            div do
              render partial: 'orders/form', locals: {order: @order, search_value: @search_value}
            end
            div do
              p(class: 'mb-4') { 'Selected items' }
            end
          end
          button type: :submit, class: 'w-full bg-blue-600 py-4 px-8 rounded text-white mt-8' do
            'Submit'
          end
        end

      end
    end

    def turbo_frame_tag(id, &blk)
      turbo_frame id: id do
        yield
      end
    end
  end
end