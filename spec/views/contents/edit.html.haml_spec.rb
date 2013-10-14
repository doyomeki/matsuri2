require 'spec_helper'

describe "contents/edit" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :event_id => 1,
      :booth_id => 1,
      :title => "MyString",
      :description => "MyString",
      :speaker_name => "MyString",
      :speaker_profile => "MyString",
      :speaker_image => "MyString"
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", content_path(@content), "post" do
      assert_select "input#content_event_id[name=?]", "content[event_id]"
      assert_select "input#content_booth_id[name=?]", "content[booth_id]"
      assert_select "input#content_title[name=?]", "content[title]"
      assert_select "input#content_description[name=?]", "content[description]"
      assert_select "input#content_speaker_name[name=?]", "content[speaker_name]"
      assert_select "input#content_speaker_profile[name=?]", "content[speaker_profile]"
      assert_select "input#content_speaker_image[name=?]", "content[speaker_image]"
    end
  end
end
