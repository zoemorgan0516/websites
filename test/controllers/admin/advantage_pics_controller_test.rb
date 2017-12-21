require 'test_helper'

class Admin::AdvantagePicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_advantage_pic = admin_advantage_pics(:one)
  end

  test "should get index" do
    get admin_advantage_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_advantage_pic_url
    assert_response :success
  end

  test "should create admin_advantage_pic" do
    assert_difference('Admin::AdvantagePic.count') do
      post admin_advantage_pics_url, params: { admin_advantage_pic: {  } }
    end

    assert_redirected_to admin_advantage_pic_url(Admin::AdvantagePic.last)
  end

  test "should show admin_advantage_pic" do
    get admin_advantage_pic_url(@admin_advantage_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_advantage_pic_url(@admin_advantage_pic)
    assert_response :success
  end

  test "should update admin_advantage_pic" do
    patch admin_advantage_pic_url(@admin_advantage_pic), params: { admin_advantage_pic: {  } }
    assert_redirected_to admin_advantage_pic_url(@admin_advantage_pic)
  end

  test "should destroy admin_advantage_pic" do
    assert_difference('Admin::AdvantagePic.count', -1) do
      delete admin_advantage_pic_url(@admin_advantage_pic)
    end

    assert_redirected_to admin_advantage_pics_url
  end
end
