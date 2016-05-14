require 'test_helper'

class CarShowsControllerTest < ActionController::TestCase
  setup do
    @car_show = car_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:car_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car_show" do
    assert_difference('CarShow.count') do
      post :create, car_show: { end: @car_show.end, start: @car_show.start }
    end

    assert_redirected_to car_show_path(assigns(:car_show))
  end

  test "should show car_show" do
    get :show, id: @car_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car_show
    assert_response :success
  end

  test "should update car_show" do
    patch :update, id: @car_show, car_show: { end: @car_show.end, start: @car_show.start }
    assert_redirected_to car_show_path(assigns(:car_show))
  end

  test "should destroy car_show" do
    assert_difference('CarShow.count', -1) do
      delete :destroy, id: @car_show
    end

    assert_redirected_to car_shows_path
  end
end
