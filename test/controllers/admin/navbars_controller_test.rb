require 'test_helper'

class Admin::NavbarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_navbar = admin_navbars(:one)
  end

  test "should get index" do
    get admin_navbars_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_navbar_url
    assert_response :success
  end

  test "should create admin_navbar" do
    assert_difference('Admin::Navbar.count') do
      post admin_navbars_url, params: { admin_navbar: {  } }
    end

    assert_redirected_to admin_navbar_url(Admin::Navbar.last)
  end

  test "should show admin_navbar" do
    get admin_navbar_url(@admin_navbar)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_navbar_url(@admin_navbar)
    assert_response :success
  end

  test "should update admin_navbar" do
    patch admin_navbar_url(@admin_navbar), params: { admin_navbar: {  } }
    assert_redirected_to admin_navbar_url(@admin_navbar)
  end

  test "should destroy admin_navbar" do
    assert_difference('Admin::Navbar.count', -1) do
      delete admin_navbar_url(@admin_navbar)
    end

    assert_redirected_to admin_navbars_url
  end
end
