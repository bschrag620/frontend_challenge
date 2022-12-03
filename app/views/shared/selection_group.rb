module Views
  class Shared::SelectionGroup < Phlex::HTML
    def initialize(heading: '', **opts)
      @heading = heading
      @opts = opts
    end

    def template(&blk)
      div(class: 'mb-4', **@opts) do
        render Views::Shared::SemiBoldP.new { @heading }
        render Views::Shared::Separator.new
        div(class: 'flex flex-col') do
          yield_content(&blk)
        end
      end
    end

    def checkbox(**opts)
      render Views::Shared::Checkbox.new(**opts)
    end
  end
end