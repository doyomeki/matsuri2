require 'spec_helper'

describe "contents/show" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :event_id => 1,
      :room_id => 2,
      :title => "Title",
      :description => "Description",
      :speaker_name => "Speaker Name",
      :speaker_profile => "Speaker Profile",
      :speaker_image => "Speaker Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Speaker Name/)
    rendered.should match(/Speaker Profile/)
    rendered.should match(/Speaker Image/)
  end
end
