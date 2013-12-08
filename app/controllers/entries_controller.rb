class EntriesController < ApplicationController
  before_action :set_content, only: [:insert_and_delete]
  before_action :set_user, only: [:insert_and_delete]

  def insert_and_delete
    if Entry.status(@content, @user) then
      @entry = Entry.where(content_id: @content.id, user_id: @user.id).first
      @another_content = Entry.another_status(@content)
      @entry.destroy!
      respond_to do |format|
        @status = Entry.status(@content, @user)
        format.js
      end
    else
      delete
      @entry = Entry.new(id: @entry_id, content_id: @content.id, user_id: @user.id)
      respond_to do |format|
        if @entry.save then
          @status = Entry.status(@content, @user)
          @another_content = Entry.another_status(@content)
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

    def delete
      @entries = Entry.all
      @entries.each do |entry|
        if Content.find(entry.content_id).start_at == @content.start_at && entry.user_id.to_s == params[:user_id] then
          @entry_id = entry.id
          entry.destroy!
        end
      end
    end
end
