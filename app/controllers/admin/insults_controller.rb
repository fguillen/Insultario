class Admin::InsultsController < ApplicationController
  def create
    insult = Insult.new(insult_params)

    if insult.save
      render :json => { :insult => insult.to_hash }, :status => :created
    else
      render :json => { :insult => insult.to_hash, :errors => insult.errors.full_messages }, :status => :error
    end
  end

  private

  def insult_params
    params.require(:insult).permit!
  end
end
