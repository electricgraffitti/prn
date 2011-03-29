require 'test_helper'

class AmenitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amenities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amenity" do
    assert_difference('Amenity.count') do
      post :create, :amenity => { }
    end

    assert_redirected_to amenity_path(assigns(:amenity))
  end

  test "should show amenity" do
    get :show, :id => amenities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => amenities(:one).to_param
    assert_response :success
  end

  test "should update amenity" do
    put :update, :id => amenities(:one).to_param, :amenity => { }
    assert_redirected_to amenity_path(assigns(:amenity))
  end

  test "should destroy amenity" do
    assert_difference('Amenity.count', -1) do
      delete :destroy, :id => amenities(:one).to_param
    end

    assert_redirected_to amenities_path
  end
end
