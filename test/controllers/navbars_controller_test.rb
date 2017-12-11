require 'test_helper'

class NavbarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @navbar = navbars(:one)
  end

  test "should get index" do
    get navbars_url
    assert_response :success
  end

  test "should get new" do
    get new_navbar_url
    assert_response :success
  end

  test "should create navbar" do
    assert_difference('Navbar.count') do
      post navbars_url, params: { navbar: {  } }
    end

    assert_redirected_to navbar_url(Navbar.last)
  end

  test "should show navbar" do
    get navbar_url(@navbar)
    assert_response :success
  end

  test "should get edit" do
    get edit_navbar_url(@navbar)
    assert_response :success
  end

  test "should update navbar" do
    patch navbar_url(@navbar), params: { navbar: {  } }
    assert_redirected_to navbar_url(@navbar)
  end

  test "should destroy navbar" do
    assert_difference('Navbar.count', -1) do
      delete navbar_url(@navbar)
    end

    assert_redirected_to navbars_url
  end
end
