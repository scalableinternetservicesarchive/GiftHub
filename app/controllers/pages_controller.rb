class PagesController < ApplicationController
  def index
  	@exchanges = Exchange.all #.select { |e| Time.at(e.registration_end) > DateTime.now }

    respond_to do |format|
      format.html
      format.json { render json: @exchanges }
    end
  end

  def dashboard
  	  @myExchangeProfiles = ExchangeProfile.all.select { |e| e.user_id ==  current_user.id }
  	  @myExchanges = []
      for event in @myExchangeProfiles
        @myExchanges.append(Exchange.find(event.exchange_id))
      end

  end
end
