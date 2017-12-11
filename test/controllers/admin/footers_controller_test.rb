require 'test_helper'

class Admin::FootersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_footer = admin_footers(:one)
  end

  test "should get index" do
    get admin_footers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_footer_url
    assert_response :success
  end

  test "should create admin_footer" do
    assert_difference('Admin::Footer.count') do
      post admin_footers_url, params: { admin_footer: {  } }
    end

    assert_redirected_to admin_footer_url(Admin::Footer.last)
  end

  test "should show admin_footer" do
    get admin_footer_url(@admin_footer)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_footer_url(@admin_footer)
    assert_response :success
  end

  test "should update admin_footer" do
    patch admin_footer_url(@admin_footer), params: { admin_footer: {  } }
    assert_redirected_to admin_footer_url(@admin_footer)
  end

  test "should destroy admin_footer" do
    assert_difference('Admin::Footer.count', -1) do
      delete admin_footer_url(@admin_footer)
    end

    assert_redirected_to admin_footers_url
  end
end
