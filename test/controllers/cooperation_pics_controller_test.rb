require 'test_helper'

class CooperationPicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooperation_pic = cooperation_pics(:one)
  end

  test "should get index" do
    get cooperation_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_cooperation_pic_url
    assert_response :success
  end

  test "should create cooperation_pic" do
    assert_difference('CooperationPic.count') do
      post cooperation_pics_url, params: { cooperation_pic: {  } }
    end

    assert_redirected_to cooperation_pic_url(CooperationPic.last)
  end

  test "should show cooperation_pic" do
    get cooperation_pic_url(@cooperation_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooperation_pic_url(@cooperation_pic)
    assert_response :success
  end

  test "should update cooperation_pic" do
    patch cooperation_pic_url(@cooperation_pic), params: { cooperation_pic: {  } }
    assert_redirected_to cooperation_pic_url(@cooperation_pic)
  end

  test "should destroy cooperation_pic" do
    assert_difference('CooperationPic.count', -1) do
      delete cooperation_pic_url(@cooperation_pic)
    end

    assert_redirected_to cooperation_pics_url
  end
end
