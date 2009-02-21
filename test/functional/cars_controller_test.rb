require 'test_helper'

class CarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cars" do
    assert_difference('Cars.count') do
      post :create, :cars => { }
    end

    assert_redirected_to cars_path(assigns(:cars))
  end

  test "should show cars" do
    get :show, :id => cars(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cars(:one).id
    assert_response :success
  end

  test "should update cars" do
    put :update, :id => cars(:one).id, :cars => { }
    assert_redirected_to cars_path(assigns(:cars))
  end

  test "should destroy cars" do
    assert_difference('Cars.count', -1) do
      delete :destroy, :id => cars(:one).id
    end

    assert_redirected_to cars_path
  end
end
