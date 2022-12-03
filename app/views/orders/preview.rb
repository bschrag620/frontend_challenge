module Views
  class Orders::Preview < Phlex::HTML

    def initialize(order:)
      @order = order
      @entrees = order.entrees
      @appetizers = order.appetizers
      @desserts = order.desserts
    end

    def template
      if @entrees.any?
        render Views::Shared::FlexGroup.new(heading: 'Entrees') do |group|
          render Views::Shared::Clicker.new(target_selector: '#entree-select-all') do
            text 'Remove all'
          end if @entrees.length == Entree.all.count
          @entrees.each do |entree|
            render Views::Shared::Clicker.new(target_selector: "#entree_#{entree.id}") do
              text entree.name
            end
          end
        end
      end

      if @appetizers.any?
        render Views::Shared::FlexGroup.new(heading: 'Appetizers') do |group|
          render Views::Shared::Clicker.new(target_selector: '#appetizer-select-all') do
            text 'Remove all'
          end if @appetizers.length == Appetizer.all.count
          @appetizers.each do |appetizer|
            render Views::Shared::Clicker.new(target_selector: "#appetizer_#{appetizer.id}") do
              text appetizer.name
            end
          end
        end
      end

      if @desserts.any?
        render Views::Shared::FlexGroup.new(heading: 'Desserts') do |group|
          render Views::Shared::Clicker.new(target_selector: '#dessert-select-all') do
            text 'Remove all'
          end if @desserts.length == Dessert.all.count
          @desserts.each do |dessert|
            render Views::Shared::Clicker.new(target_selector: "#dessert_#{dessert.id}") do
              text dessert.name
            end
          end
        end
      end
    end
  end
end