require 'test_helper'

class DiningTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dining_tables_index_url
    assert_response :success
  end

end
