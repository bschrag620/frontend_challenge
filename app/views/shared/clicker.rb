module Views
  class Shared::Clicker < Phlex::HTML
    def initialize(target_selector:, **opts)
      @target_selector = target_selector
    end

    def template(&blk)
      div class: 'flex flex-row justify-between' do
        div do
          yield_content &blk
        end

        button data: {controller: 'clicker', clicker_selector_value: @target_selector} do
          'X'
        end
      end
    end
  end
end

