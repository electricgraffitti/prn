require 'test_helper'

class SuiteSpecsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suite_specs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suite_spec" do
    assert_difference('SuiteSpec.count') do
      post :create, :suite_spec => { }
    end

    assert_redirected_to suite_spec_path(assigns(:suite_spec))
  end

  test "should show suite_spec" do
    get :show, :id => suite_specs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => suite_specs(:one).to_param
    assert_response :success
  end

  test "should update suite_spec" do
    put :update, :id => suite_specs(:one).to_param, :suite_spec => { }
    assert_redirected_to suite_spec_path(assigns(:suite_spec))
  end

  test "should destroy suite_spec" do
    assert_difference('SuiteSpec.count', -1) do
      delete :destroy, :id => suite_specs(:one).to_param
    end

    assert_redirected_to suite_specs_path
  end
end
