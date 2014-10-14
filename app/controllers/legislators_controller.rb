class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all
  end

  def show
  end

  def destroy
  end
end
