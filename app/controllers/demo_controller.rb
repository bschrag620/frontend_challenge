class DemoController < ApplicationController
  def index
    render Views::Demo::Index.new
  end
end