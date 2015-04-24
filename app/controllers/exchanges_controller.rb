class ExchangesController < ApplicationController
	def index
		@exchanges = Exchange.all
	end


	private
	def exchange_params
		params.require(:exchange).permit(:name, :thumburl)
	end

end
