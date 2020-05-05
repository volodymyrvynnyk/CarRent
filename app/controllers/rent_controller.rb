class RentController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @cars = Car.order(:updated_at)
  end
end
