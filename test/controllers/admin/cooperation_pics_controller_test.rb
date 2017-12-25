require 'test_helper'

class Admin::CooperationPicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_cooperation_pic = admin_cooperation_pics(:one)
  end

  test "should get index" do
    get admin_cooperation_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cooperation_pic_url
    assert_response :success
  end

  test "should create admin_cooperation_pic" do
    assert_difference('Admin::CooperationPic.count') do
      post admin_cooperation_pics_url, params: { admin_cooperation_pic: {  } }
    end

    assert_redirected_to admin_cooperation_pic_url(Admin::CooperationPic.last)
  end

  test "should show admin_cooperation_pic" do
    get admin_cooperation_pic_url(@admin_cooperation_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cooperation_pic_url(@admin_cooperation_pic)
    assert_response :success
  end

  test "should update admin_cooperation_pic" do
    patch admin_cooperation_pic_url(@admin_cooperation_pic), params: { admin_cooperation_pic: {  } }
    assert_redirected_to admin_cooperation_pic_url(@admin_cooperation_pic)
  end

  test "should destroy admin_cooperation_pic" do
    assert_difference('Admin::CooperationPic.count', -1) do
      delete admin_cooperation_pic_url(@admin_cooperation_pic)
    end

    assert_redirected_to admin_cooperation_pics_url
  end
end
