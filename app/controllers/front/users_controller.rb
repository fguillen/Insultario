class Front::UsersController < ApplicationController
  def create
    @user = User.create!
    render :json => @user.to_hash, :status => :ok
  end
end
