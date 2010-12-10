require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    @update = {
      :performer   => 'Charlie Apicella & Iron City',
      :date        => '11/19',
      :time        => '8pm',
      :description => "With their soulful retro sound, IRON CITY's mission is to keep the people's feet tappin', heads bobbin', and groove. Powered by the compelling original tunes of guitarist Apicella, IRON CITY strives to break new ground while also drawing inspiration from the true masters of groove: Grant Green, Dr. Lonnie Smith, Lou Donaldson, Michael Jackson, and James Brown.",
      :image_url   => 'ironcity.jpg',
      :price       => 10.00
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, :event => @update
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, :id => @event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @event.to_param
    assert_response :success
  end

  test "should update event" do
    put :update, :id => @event.to_param, :event => @update
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, :id => @event.to_param
    end

    assert_redirected_to events_path
  end
end
