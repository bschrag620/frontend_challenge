module Views
  class Demo::Index < ApplicationView
    def template
      h1 { 'Hello world' }
    end
  end
end