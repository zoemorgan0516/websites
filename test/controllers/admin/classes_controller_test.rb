require 'test_helper'

class Admin::ClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_class = admin_classes(:one)
  end

  test "should get index" do
    get admin_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_class_url
    assert_response :success
  end

  test "should create admin_class" do
    assert_difference('Admin::Class.count') do
      post admin_classes_url, params: { admin_class: { Footer: @admin_class.Footer } }
    end

    assert_redirected_to admin_class_url(Admin::Class.last)
  end

  test "should show admin_class" do
    get admin_class_url(@admin_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_class_url(@admin_class)
    assert_response :success
  end

  test "should update admin_class" do
    patch admin_class_url(@admin_class), params: { admin_class: { Footer: @admin_class.Footer } }
    assert_redirected_to admin_class_url(@admin_class)
  end

  test "should destroy admin_class" do
    assert_difference('Admin::Class.count', -1) do
      delete admin_class_url(@admin_class)
    end

    assert_redirected_to admin_classes_url
  end
end
