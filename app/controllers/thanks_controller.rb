class ThanksController < ApplicationController
  skip_before_filter :authorize

  def index
    current_cart.destroy
  end
end
