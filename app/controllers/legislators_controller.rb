class LegislatorsController < ApplicationController
  def index
    @legislators = LegislatorDecorator.all
  end

  def show
  end

  def destroy
  end
end
