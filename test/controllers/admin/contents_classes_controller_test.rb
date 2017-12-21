require 'test_helper'

class Admin::ContentsClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_contents_class = admin_contents_classes(:one)
  end

  test "should get index" do
    get admin_contents_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_contents_class_url
    assert_response :success
  end

  test "should create admin_contents_class" do
    assert_difference('Admin::ContentsClass.count') do
      post admin_contents_classes_url, params: { admin_contents_class: {  } }
    end

    assert_redirected_to admin_contents_class_url(Admin::ContentsClass.last)
  end

  test "should show admin_contents_class" do
    get admin_contents_class_url(@admin_contents_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_contents_class_url(@admin_contents_class)
    assert_response :success
  end

  test "should update admin_contents_class" do
    patch admin_contents_class_url(@admin_contents_class), params: { admin_contents_class: {  } }
    assert_redirected_to admin_contents_class_url(@admin_contents_class)
  end

  test "should destroy admin_contents_class" do
    assert_difference('Admin::ContentsClass.count', -1) do
      delete admin_contents_class_url(@admin_contents_class)
    end

    assert_redirected_to admin_contents_classes_url
  end
end
