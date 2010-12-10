class ListingController < ApplicationController
  skip_before_filter :authorize

  def index
    @title = "Online Box Office"
    @events = Event.where(:pushkin => false)
    @pushkinevents = Event.where(:pushkin => true)
    @cart = current_cart
  end

end
