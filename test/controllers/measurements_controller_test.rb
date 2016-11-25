require 'test_helper'

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get measurements_index_url
    assert_response :success
  end

  test "should get import" do
    get measurements_import_url
    assert_response :success
  end

end
