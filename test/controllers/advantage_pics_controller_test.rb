require 'test_helper'

class AdvantagePicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advantage_pic = advantage_pics(:one)
  end

  test "should get index" do
    get advantage_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_advantage_pic_url
    assert_response :success
  end

  test "should create advantage_pic" do
    assert_difference('AdvantagePic.count') do
      post advantage_pics_url, params: { advantage_pic: {  } }
    end

    assert_redirected_to advantage_pic_url(AdvantagePic.last)
  end

  test "should show advantage_pic" do
    get advantage_pic_url(@advantage_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_advantage_pic_url(@advantage_pic)
    assert_response :success
  end

  test "should update advantage_pic" do
    patch advantage_pic_url(@advantage_pic), params: { advantage_pic: {  } }
    assert_redirected_to advantage_pic_url(@advantage_pic)
  end

  test "should destroy advantage_pic" do
    assert_difference('AdvantagePic.count', -1) do
      delete advantage_pic_url(@advantage_pic)
    end

    assert_redirected_to advantage_pics_url
  end
end
