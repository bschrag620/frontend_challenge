module Views
  class Shared::TextInput < Phlex::HTML
    def initialize(name: '', label: '', **opts)
      @opts = opts
      @name = name
      @label = label
    end

    def template
      label { @label }
      br
      input type: 'text', name: @name, **@opts
    end
  end
end