class Admin::InsultsController < ApplicationController
  before_action :require_password

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

  def require_password
    if(params[:password] != ENV.fetch('ADMIN_PASSWORD') { 'admin_password' })
      render :json => { :message => "Not authorized" }, :status => :unauthorized
      return false
    end
  end
end
