class LineItem < ApplicationRecord
  belongs_to :car
  belongs_to :cart
  def total_price
    car.price * hours
  end
end
