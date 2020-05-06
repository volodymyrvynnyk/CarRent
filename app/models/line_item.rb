class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :car
  belongs_to :cart, optional: true

  def total_price
    car.price * hours
  end
end
