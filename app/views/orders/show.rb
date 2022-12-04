module Views
  class Orders::Show < Phlex::HTML
    def initialize(order:)
      @order = order
      @entrees = order.entrees
      @appetizers = order.appetizers
      @desserts = order.desserts
    end

    def template
      div class: 'max-w-lg mx-auto w-full mt-12' do
        h1(class: 'text-xl mb-2') { 'Your order details' }
        div do
          if @appetizers.any?
            render Views::Shared::FlexGroup.new(heading: 'Appetizers') do |group|
              @appetizers.each do |appetizer|
                text appetizer.name
                br
              end
            end
          end

          if @entrees.any?
            render Views::Shared::FlexGroup.new(heading: 'Entrees') do |group|
              @entrees.each do |entree|
                text entree.name
                br
              end
            end
          end

          if @desserts.any?
            render Views::Shared::FlexGroup.new(heading: 'Desserts') do |group|
              @desserts.each do |dessert|
                text dessert.name
                br
              end
            end
          end
        end
      end
    end
  end
end