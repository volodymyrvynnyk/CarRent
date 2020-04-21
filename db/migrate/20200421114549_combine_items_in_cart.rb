class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def change
  end

  def up
# single item
    Cart.all.each do |cart|
      sums = cart.line_items.group(:car_id).sum(:hours)
      sums.each do |car_id, hours|
        if hours > 1
# remove individual items
          cart.line_items.where(car_id: car_id).delete_all
# replace with a single item
          item = cart.line_items.build(car_id: car_id)
          item.hours = hours
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where("hours>1").each do |line_item|
# add individual items
      line_item.hours.times do
        LineItem.create(
            cart_id: line_item.cart_id,
            car_id: line_item.car_id,
            hours: 1
        )
      end
# remove original item
      line_item.destroy
    end
  end
end
