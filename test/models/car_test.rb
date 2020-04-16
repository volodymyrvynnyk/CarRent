require 'test_helper'

class CarTest < ActiveSupport::TestCase
  fixtures :cars
  test 'car attributes must not be empty' do
    car = Car.new
    assert car.invalid?
    assert car.errors[:brand].any?
    assert car.errors[:model].any?
    assert car.errors[:description].any?
    assert car.errors[:price].any?
    assert car.errors[:image_url].any?
    assert car.errors[:transmission].any?
    assert car.errors[:seats].any?
    assert car.errors[:body].any?
  end

  test 'car price must be positive' do
    car = Car.new(
        brand: 'Toyota',
        model: 'Rav4',
        description: 'AWD 2.2 diesel',
        price: -1,
        image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/2013_Toyota_RAV4_XLE_AWD_front_
                              left.jpg/250px-2013_Toyota_RAV4_XLE_AWD_front_left.jpg",
        transmission: 'Automatic, 4x4',
        seats: 5,
        body: 'SUV'
    )
    car.price = -1
    assert car.invalid?
    assert_equal ['must be greater than or equal to 1'],
                 car.errors[:price]
    car.price = 0
    assert car.invalid?
    assert_equal ['must be greater than or equal to 1'],
                 car.errors[:price]
    car.price = 2
    assert car.valid?
  end

  def new_car(image_url)
    Car.new(brand: 'Toyota',
            model: 'Rav4',
            description: 'AWD 2.2 diesel',
            price: 350,
            image_url: image_url,
            transmission: 'Automatic, 4x4',
            seats: 5,
            body: "SUV"
    )
  end

  test 'image url' do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
          http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_car(name).valid?, "#{name} shouldn't be invalid"
    end
    bad.each do |name|
      assert new_car(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test 'transmission' do
    car = Car.new(transmission: cars(:sprinter).transmission)
    assert car.transmission.match?(%r{[A-Z]{1}[a-z]{5,10},\s\dx\d\Z}i), 'Transmission failure'
  end
end
