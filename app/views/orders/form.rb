module Views
  class Orders::Form < Phlex::HTML
      register_element(:turbo_frame)

    def initialize(order:, search_value: '', entrees: Entree.all, appetizers: Appetizer.all, desserts: Dessert.all)
      @order = order
      @entrees = entrees
      @appetizers = appetizers
      @desserts = desserts
      @scopes = []
      @search_value = search_value
    end

    def turbo_frame_tag(id, &blk)
      turbo_frame id: id do
        yield
      end
    end

    def fields_for(scope, &blk)
      @scopes << scope
      yield_content(&blk)
      @scopes.pop
    end

    def field_name(*fields, multiple: false)
      ret = @_view_context.field_name(ActiveModel::Naming.param_key(@order.class), *@scopes + fields).dup
      ret << '[]' if multiple
      ret
    end

    def template
      form action: @_view_context.url_for(@order), method: :post, data: {controller: 'searchable-form previewable-form', previewable_form_previewer_outlet: 'order-preview', searchable_form_search_outlet: '#order-search'}, id: 'order-form' do |f|
        input(name: "authenticity_token", type: "hidden", value: @_view_context.form_authenticity_token)
        input(name: "search_value", type: "hidden", value: @search_value, data: {searchable_form_target: 'formValue'})
        p(class: 'mb-4') { 'All Items' }
        fields_for(:entree_ids) do
          none = @entrees.all? { |e| e.name.downcase.exclude?(@search_value.downcase) }
          render Views::Shared::FlexGroup.new(heading: 'Entrees', data: {controller: 'selection-group'}, class: "#{'hidden' if @search_value.present? && none}") do |group|
            span class: "#{'hidden' if @search_value.present?}" do
              group.checkbox(class: "mb-2", id: 'entree-select-all', checked: false, label: 'Select All', data: {selection_group_target: 'all'})
            end
            @entrees.each do |entree|
              span class: "#{'hidden' if @search_value.present? && entree.name.downcase.exclude?(@search_value.downcase)}" do
                group.checkbox(name: field_name(multiple: true), id: "entree_#{entree.id}",value: entree.id, class: "mb-2", checked: @order.entrees.include?(entree), label: entree.name, data: {selection_group_target: 'selectable'})
              end
            end
          end
        end

        fields_for(:appetizer_ids) do
          none = @appetizers.all? { |a| a.name.downcase.exclude?(@search_value.downcase) }
          render Views::Shared::FlexGroup.new(heading: 'Appetizers', data: {controller: 'selection-group'}, class: "#{'hidden' if @search_value.present? && none}") do |group|
            span class: "#{'hidden' if @search_value.present?}" do
              group.checkbox(class: "mb-2 #{'hidden' if @search_value.present?}", checked: false, id: 'appetizer-select-all', label: 'Select All', data: {selection_group_target: 'all'})
            end
            @appetizers.each do |appetizer|
              span class: "#{'hidden' if @search_value.present? && appetizer.name.downcase.exclude?(@search_value.downcase)}" do
                group.checkbox(name: field_name(multiple: true), value: appetizer.id, id: "appetizer_#{appetizer.id}", class: "mb-2", checked: @order.appetizers.include?(appetizer), label: appetizer.name, data: {selection_group_target: 'selectable'})
              end
            end
          end
        end

        fields_for(:dessert_ids) do
          none = @desserts.all? { |d| d.name.downcase.exclude?(@search_value.downcase) }
          render Views::Shared::FlexGroup.new(heading: 'Desserts', data: {controller: 'selection-group'}, class: "#{'hidden' if @search_value.present? && none}") do |group|
            span class: "#{'hidden' if @search_value.present?}" do
              group.checkbox(class: "mb-2 #{'hidden' if @search_value.present?}", checked: false, id: 'dessert-select-all', label: 'Select All', data: {selection_group_target: 'all'})
            end
            @desserts.each do |dessert|
              span class: "#{'hidden' if @search_value.present? && dessert.name.downcase.exclude?(@search_value.downcase)}" do
                group.checkbox(name: field_name(multiple: true), value: dessert.id, id: "dessert_#{dessert.id}", class: "mb-2", checked: @order.desserts.include?(dessert), label: dessert.name, data: {selection_group_target: 'selectable'})
              end
            end
          end
        end
      end
    end
  end
end