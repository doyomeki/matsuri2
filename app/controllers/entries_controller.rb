class EntriesController < ApplicationController
  before_action :set_content, only: [:insert_and_delete]
  before_action :set_user, only: [:insert_and_delete]

  def insert_and_delete
    @entry = @content.entries.where(user_id: @user.id).first
    if @entry
      @entry.destroy
      respond_to do |format|
        @status = @content.entries.where(user_id: @user.id).present?
        format.js
      end
    else
      @entry = Entry.new(content_id: @content.id, user_id: @user.id)
      respond_to do |format|
        if @entry.save then
          @status = @content.entries.where(user_id: @user.id).present?
	  @other_entries = @entry.other_entries
          format.js
	end
      end
    end
  end

  private
    def set_content
      @content = Content.find(params[:content_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

=begin
    def delete
      @entries = Entry.all
      @entries.each do |entry|
        if Content.find(entry.content_id).start_at == @content.start_at && entry.user_id.to_s == params[:user_id] then
          @entry_id = entry.id
          entry.destroy!
        end
      end
    end
=end
end
