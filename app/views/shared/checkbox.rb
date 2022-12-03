module Views
  class Shared::Checkbox < Phlex::HTML
    def initialize(name: '', label: '', checked: false, **opts)
      @opts = opts
      @name = name
      @checked = checked
      @label = label
    end

    def template(&blk)
      label do
        input type: 'checkbox', name: @name, checked: @checked, **@opts
        text @label
      end
    end
  end
end