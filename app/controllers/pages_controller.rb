class PagesController < ApplicationController
  def index
  	@exchanges = Exchange.select { |e| Time.at(e.registration_end) > DateTime.now && e.registration_start <= DateTime.now}

    respond_to do |format|
      format.html
      format.json { render json: @exchanges }
    end
  end
end
