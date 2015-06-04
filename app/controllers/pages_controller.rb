class PagesController < ApplicationController
  def index
  	@exchanges = Exchange.select { |e| Time.at(e.registration_end) > DateTime.now && e.registration_start <= DateTime.now}

    respond_to do |format|
      format.html
      format.json { render json: @exchanges }
    end
  end

  def dashboard
      @photo = Photo.new
  	  @myExchangeProfiles = ExchangeProfile.select { |e| e.user_id ==  current_user.id }
  	  @myExchanges = []
      for event in @myExchangeProfiles
      	item = Exchange.find_by(id: event.exchange_id) #use find by to avoid not found exception
      	if(item != nil)
        	@myExchanges.append(item)
        end
      end

  end
  
end
