class EntriesController < ApplicationController
  before_action :set_content, only: [:insert_and_delete]
  before_action :set_user, only: [:insert_and_delete]

  def insert_and_delete
    @entry = @content.entries.find_by_user_id(@user.id)
    if @entry
      @entry.destroy
      respond_to do |format|
        @status = @entry.present?
        format.js
      end
    else
      @entry = Entry.new(content_id: @content.id, user_id: @user.id)
      respond_to do |format|
        if @entry.save then
          @status =  @entry.present?
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
