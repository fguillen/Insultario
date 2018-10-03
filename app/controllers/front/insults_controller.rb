class Front::InsultsController < ApplicationController
  before_action :load_user
  before_action :load_insult_card, :only => [:show, :readed, :loved, :mark_as_readed, :mark_as_loved, :mark_as_unloved]

  def show
    render_insult_card
  end

  def index
    @insult_cards = @user.insult_cards
    render_insult_cards
  end

  def mark_as_readed
    @insult_card.readed!
    render_insult_card
  end

  def mark_as_loved
    @insult_card.loved!
    render_insult_card
  end

  def mark_as_unloved
    @insult_card.unloved!
    render_insult_card
  end

  # def next
  #   @insult = @insult.next

  #   render_insult

  # rescue ActiveRecord::RecordNotFound
  #   render :nothing => true, :status => :not_found, :content_type => 'application/json'
  # end

  # def previous
  #   @insult = @insult.previous

  #   render_insult

  # rescue ActiveRecord::RecordNotFound
  #   render :nothing => true, :status => :not_found, :content_type => 'application/json'
  # end

  private

  def load_user
    @user = User.where(:uuid => params[:user_id]).first!
  end

  def load_insult_card
    @insult_card = @user.insult_cards.joins(:insult).where(:insults => { :uuid => params[:id] }).first!
  end

  def render_insult_card
    render :json => @insult_card.to_hash, :status => :ok
  end

  def render_insult_cards
    render :json => @insult_cards.map(&:to_hash), :status => :ok
  end
end
