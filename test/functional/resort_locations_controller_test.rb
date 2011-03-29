require 'test_helper'

class ResortLocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resort_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resort_location" do
    assert_difference('ResortLocation.count') do
      post :create, :resort_location => { }
    end

    assert_redirected_to resort_location_path(assigns(:resort_location))
  end

  test "should show resort_location" do
    get :show, :id => resort_locations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => resort_locations(:one).to_param
    assert_response :success
  end

  test "should update resort_location" do
    put :update, :id => resort_locations(:one).to_param, :resort_location => { }
    assert_redirected_to resort_location_path(assigns(:resort_location))
  end

  test "should destroy resort_location" do
    assert_difference('ResortLocation.count', -1) do
      delete :destroy, :id => resort_locations(:one).to_param
    end

    assert_redirected_to resort_locations_path
  end
end
