class TrailsController < ApplicationController

  def show
    @trial = Trail.find(params[:id])
  end

end