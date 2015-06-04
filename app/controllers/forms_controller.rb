class FormsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	@currentExchange
  @@myEvent

  def index
  	@forms = Form.all
  end

  def new

    if(!user_signed_in?)
      redirect_to pages_path, :notice => "You need to sign in to participate!" and return false   
    end

		@currentExchange = params[:name]
		if exchange = Exchange.find_by_name(@currentExchange)
			if exchange.registration_start > DateTime.now
				redirect_to pages_path, :notice => "Sorry, the registration period for this exchange has not yet started. Please check back when registration is open."
			end
		end
    
  	@form = Form.new
  	@currentExchange = params[:name]
    @currentExchangeID = params[:exchange_id]
  	# raise @currentExchange

    event = Exchange.find(params[:exchange_id])
    @@myEvent = event
    oldSignUp = ExchangeProfile.where(user_id: current_user.id, exchange_id: event.id)
    if(!oldSignUp.empty?)
      redirect_to pages_path, :notice => "You have already signed up for this event!" and return false       
    end
    
  end

  def create

  	@form = Form.new(:exchangeName => params[:currentExchange], 
      :categoryID => 123, :userEmail => current_user.email, 
      :notes => params[:form][:notes], 
      :favorite => params[:form][:favorite])

    event = @@myEvent

    if (event != nil)
        xchangeprofile = ExchangeProfile.new(user_id: current_user.id, exchange_id: event.id, gift_received:false)
        xchangeprofile.save
    end
    
    if @form.save
  		redirect_to pages_path, :notice => "Thank you for signing up"
  	else
  		render ('new')
  	end
  end

  private
  def form_params
  	params.require(:form).permit(:exchangeName,:categoryID,:userEmail,:notes, :favorite)
  end


end
