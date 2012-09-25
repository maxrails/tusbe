require 'test_helper'

class BookLinksControllerTest < ActionController::TestCase
  setup do
    @book_link = book_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_link" do
    assert_difference('BookLink.count') do
      post :create, book_link: { book_id: @book_link.book_id, email: @book_link.email }
    end

    assert_redirected_to book_link_path(assigns(:book_link))
  end

  test "should show book_link" do
    get :show, id: @book_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_link
    assert_response :success
  end

  test "should update book_link" do
    put :update, id: @book_link, book_link: { book_id: @book_link.book_id, email: @book_link.email }
    assert_redirected_to book_link_path(assigns(:book_link))
  end

  test "should destroy book_link" do
    assert_difference('BookLink.count', -1) do
      delete :destroy, id: @book_link
    end

    assert_redirected_to book_links_path
  end
end
