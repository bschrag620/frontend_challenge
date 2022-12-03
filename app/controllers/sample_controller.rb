class SampleController < ApplicationController
  def index
    render Views::Sample::Index.new
  end

end