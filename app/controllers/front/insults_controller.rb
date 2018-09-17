class Front::InsultsController < ApplicationController
  before_action :load_insult, :only => [:show, :next, :previous]
  def random
    @insult = Insult.random

    render_insult
  end

  def show
    render_insult
  end

  def next
    @insult = @insult.next

    render_insult

  rescue ActiveRecord::RecordNotFound
    render :nothing => true, :status => :not_found, :content_type => 'application/json'
  end

  def previous
    @insult = @insult.previous

    render_insult

  rescue ActiveRecord::RecordNotFound
    render :nothing => true, :status => :not_found, :content_type => 'application/json'
  end

  private

  def load_insult
    @insult = Insult.where(:uuid => params[:id]).first!
  end

  def render_insult
    render :json => @insult.to_hash, :status => :ok
  end
end
