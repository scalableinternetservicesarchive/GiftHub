class GalleriesController < ApplicationController
  def index
    @exchanges = Exchange.where(["registration_start < :now && registration_end < :now", { now: Time.now }] )
  end
end
