class PagesController < ApplicationController
  before_action :authenticate_user!, :only => :dashboard

  def index
    @exchanges = Exchange.where("registration_end > :now AND registration_start <= :now", { now: DateTime.now })

    respond_to do |format|
      format.html
      format.json { render json: @exchanges }
    end
  end

  def dashboard
    @exchange_profiles = ExchangeProfile.where(user_id: current_user.id)
    @exchanges = Array.new

    @exchange_profiles.each do |prof|
      @exchanges.push(prof.exchange)
    end

    respond_to do |format|
      format.html
    end
  end
  
end
