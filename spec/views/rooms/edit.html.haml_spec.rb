require 'spec_helper'

describe "rooms/edit" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :name => "MyString",
      :capacity => 1
    ))
  end

  it "renders the edit room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", room_path(@room), "post" do
      assert_select "input#room_name[name=?]", "room[name]"
      assert_select "input#room_capacity[name=?]", "room[capacity]"
    end
  end
end
