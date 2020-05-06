require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :cars
  include ActiveJob::TestHelper

  test "renting a car" do
    start_order_count = Order.count
    toyota_venza = cars(:venza)
    get "/"
    assert_response :success
    assert_select 'h1', "Rent our car"
    post '/line_items', params: {car_id: toyota_venza.id}, xhr: true
    assert_response :success
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal toyota_venza, cart.line_items[0].car
    get "/orders/new"
    assert_response :success
    # assert_select 'legend', 'Please Enter Your Details'
    perform_enqueued_jobs do
      post "/orders", params: {
          order: {
              name: "Dave Thomas",
              address: "123 The Street",
              email: "dave@example.com",
              pay_type: "Check"
          }
      }
      follow_redirect!
      assert_response :success
      assert_select 'h1', "Rent our car"
      cart = Cart.find(session[:cart_id])
      assert_equal 0, cart.line_items.size
      assert_equal start_order_count + 1, Order.count
      order = Order.last
      assert_equal "Dave Thomas", order.name
      assert_equal "123 The Street", order.address
      assert_equal "dave@example.com", order.email
      assert_equal "Check", order.pay_type

      assert_equal 1, order.line_items.size
      line_item = order.line_items[0]
      assert_equal toyota_venza, line_item.car
      mail = ActionMailer::Base.deliveries.last
      assert_equal ["dave@example.com"], mail.to
      assert_equal 'The Car Rent <thecarrent@example.com>', mail[:from].value
      assert_equal "The Car Rent Order Confirmation", mail.subject
    end
  end
end
