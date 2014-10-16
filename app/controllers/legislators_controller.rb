class LegislatorsController < ApplicationController
  def index
    @legislators = LegislatorDecorator.all
  end

  def show
    @legislator = Legislator.find(params[:id])
  end

  def destroy
  end
end
