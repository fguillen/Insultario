class Front::InsultsController < ApplicationController
  def random
    insult = Insult.random

    render :json => insult.to_hash, :status => :ok
  end

  def show
    insult = Insult.where(:uuid => params[:id]).first!

    render :json => insult.to_hash, :status => :ok
  end
end
