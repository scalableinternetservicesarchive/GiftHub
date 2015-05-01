class ExchangesController < ApplicationController
	def index
		@open_exchanges = Exchange.all.select { |e| e.registration_end > DateTime.now }
		@past_exchanges = Exchange.all.select { |e| e.registration_end < DateTime.now }
	end


	private
	def exchange_params
		params.require(:exchange).permit(:name, :thumburl)
	end

end
