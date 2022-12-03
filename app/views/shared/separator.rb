module Views
  class Shared::Separator < Phlex::HTML
    def template
      div(class: 'border border-b border-gray-200 mb-2')
    end
  end
end