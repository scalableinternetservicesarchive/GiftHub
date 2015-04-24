class PagesController < ApplicationController
  def index
  	@exchanges = Exchange.all
  end
end
