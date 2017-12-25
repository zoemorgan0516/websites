require 'test_helper'

class ContentsClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contents_class = contents_classes(:one)
  end

  test "should get index" do
    get contents_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_contents_class_url
    assert_response :success
  end

  test "should create contents_class" do
    assert_difference('ContentsClass.count') do
      post contents_classes_url, params: { contents_class: {  } }
    end

    assert_redirected_to contents_class_url(ContentsClass.last)
  end

  test "should show contents_class" do
    get contents_class_url(@contents_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_contents_class_url(@contents_class)
    assert_response :success
  end

  test "should update contents_class" do
    patch contents_class_url(@contents_class), params: { contents_class: {  } }
    assert_redirected_to contents_class_url(@contents_class)
  end

  test "should destroy contents_class" do
    assert_difference('ContentsClass.count', -1) do
      delete contents_class_url(@contents_class)
    end

    assert_redirected_to contents_classes_url
  end
end
