module Views
  class Shared::FlexGroup < Phlex::HTML
    def initialize(heading: '', **opts)
      @heading = heading
      @opts = opts
    end

    def template(&blk)
      div(class: 'mb-4', **@opts) do
        p(class: 'font-semibold mb-1') { @heading }
        render Views::Shared::Separator.new
        div(class: 'flex flex-col') do
          yield_content(&blk)
        end
      end
    end

    def checkbox(**opts)
      render Views::Shared::Checkbox.new(**opts)
    end

    def plain_text(string)
      div {
        text string
      }
    end

    def renderable(phlex_view, &blk)
      render phlex_view do
        yield if block_given?
      end
    end
  end
end