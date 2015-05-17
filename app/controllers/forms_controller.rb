class FormsController < ApplicationController

	@currentExchange

  def index
  	@forms = Form.all
  end

  def new
  	@form = Form.new
  	@currentExchange = params[:name]
    @currentExchangeID = params[:exchange_id]
  	# raise @currentExchange
  end

  def create

  	@form = Form.new(:exchangeName => params[:currentExchange], 
      :categoryID => 123, :userEmail => current_user.email, 
      :notes => params[:form][:notes], 
      :favorite => params[:form][:favorite])

    event = Exchange.find_by(name: params[:currentExchange])

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
