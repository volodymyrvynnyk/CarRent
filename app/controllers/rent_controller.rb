class RentController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to rent_index_url(locale: params[:set_locale])
    else
      @cars = Car.order(:updated_at)
    end
  end
end
