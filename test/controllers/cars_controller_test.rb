require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:venza)
    @update = {
        brand:'Tesla',
        model:'Model X',
        description: 'Wibbles are fun!',
        image_url:
            'https://upload.wikimedia.org/wikipedia/commons/c/c8/2019_Mercedes-Benz_Vito_Tourer_SELECT_119_BlueTec_2.1.jpg',
        price:
            200
    }
  end

  test "can't delete car in cart" do
    assert_difference('Car.count', 0) do
      delete car_url(cars(:sprinter))
    end
    assert_redirected_to cars_url
  end

  # test "should get index" do
  #   get cars_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_car_url
  #   assert_response :success
  # end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_url, params: { car: { body: @car.body, brand: @car.brand, description: @car.description, image_url: @car.image_url, model: @car.model, price: @car.price, seats: @car.seats, transmission: @car.transmission } }
    end

    assert_redirected_to car_url(Car.last)
  end

  # test "should show car" do
  #   get car_url(@car)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_car_url(@car)
  #   assert_response :success
  # end

  test "should update car" do
    patch car_url(@car), params: { car: { body: @car.body, brand: @car.brand, description: @car.description, image_url: @car.image_url, model: @car.model, price: @car.price, seats: @car.seats, transmission: @car.transmission } }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
