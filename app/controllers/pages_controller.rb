class PagesController < ApplicationController
  skip_before_filter :authorize
  
  def home
  end

  def calendar
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = Event.event_strips_for_month(@shown_month)
  end

  def galleries
  end

  def education
  end

  def blog
  end

end
