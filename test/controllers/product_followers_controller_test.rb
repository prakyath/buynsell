require 'test_helper'

class ProductFollowersControllerTest < ActionController::TestCase
  setup do
    @product_follower = product_followers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_followers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_follower" do
    assert_difference('ProductFollower.count') do
      post :create, product_follower: { follower_id: @product_follower.follower_id, product_id: @product_follower.product_id }
    end

    assert_redirected_to product_follower_path(assigns(:product_follower))
  end

  test "should show product_follower" do
    get :show, id: @product_follower
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_follower
    assert_response :success
  end

  test "should update product_follower" do
    patch :update, id: @product_follower, product_follower: { follower_id: @product_follower.follower_id, product_id: @product_follower.product_id }
    assert_redirected_to product_follower_path(assigns(:product_follower))
  end

  test "should destroy product_follower" do
    assert_difference('ProductFollower.count', -1) do
      delete :destroy, id: @product_follower
    end

    assert_redirected_to product_followers_path
  end
end
