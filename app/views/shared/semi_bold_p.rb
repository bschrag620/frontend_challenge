module Views
  class Shared::SemiBoldP < Phlex::HTML
    def initialize(**opts)
      @opts = mix(defaults, opts)
    end

    def defaults
      {
        class: 'font-semibold mb-1'
      }
    end

    def template(&blk)
      p(**@opts) { yield_content(&blk) }
    end
  end
end