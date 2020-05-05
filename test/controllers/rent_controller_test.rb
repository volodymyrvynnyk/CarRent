require 'test_helper'

class RentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rent_index_url
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Tesla Model X'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
