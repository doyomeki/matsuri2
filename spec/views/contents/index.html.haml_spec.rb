require 'spec_helper'

describe "contents/index" do
  before(:each) do
    assign(:contents, [
      stub_model(Content,
        :event_id => 1,
        :booth_id => 2,
        :title => "Title",
        :description => "Description",
        :speaker_name => "Speaker Name",
        :speaker_profile => "Speaker Profile",
        :speaker_image => "Speaker Image"
      ),
      stub_model(Content,
        :event_id => 1,
        :booth_id => 2,
        :title => "Title",
        :description => "Description",
        :speaker_name => "Speaker Name",
        :speaker_profile => "Speaker Profile",
        :speaker_image => "Speaker Image"
      )
    ])
  end

  it "renders a list of contents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Speaker Name".to_s, :count => 2
    assert_select "tr>td", :text => "Speaker Profile".to_s, :count => 2
    assert_select "tr>td", :text => "Speaker Image".to_s, :count => 2
  end
end
