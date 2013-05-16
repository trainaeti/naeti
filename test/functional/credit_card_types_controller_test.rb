require 'test_helper'

class CreditCardTypesControllerTest < ActionController::TestCase
  setup do
    @credit_card_type = credit_card_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_card_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_card_type" do
    assert_difference('CreditCardType.count') do
      post :create, :credit_card_type => @credit_card_type.attributes
    end

    assert_redirected_to credit_card_type_path(assigns(:credit_card_type))
  end

  test "should show credit_card_type" do
    get :show, :id => @credit_card_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @credit_card_type.to_param
    assert_response :success
  end

  test "should update credit_card_type" do
    put :update, :id => @credit_card_type.to_param, :credit_card_type => @credit_card_type.attributes
    assert_redirected_to credit_card_type_path(assigns(:credit_card_type))
  end

  test "should destroy credit_card_type" do
    assert_difference('CreditCardType.count', -1) do
      delete :destroy, :id => @credit_card_type.to_param
    end

    assert_redirected_to credit_card_types_path
  end
end
