require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received (orders(:one))
    assert_equal "The Car Rent Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /Mercedes-Benz Sprinter for  1 hours/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped (orders(:one))
    assert_equal "The Car Rent is ready", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td> Mercedes-Benz Sprinter <\/td>/ ,
                 mail.body.encoded
  end

end
