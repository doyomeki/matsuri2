class EntriesController < ApplicationController
  before_action :set_content, only: [:insert_and_delete]
  before_action :set_user, only: [:insert_and_delete]
  before_action :delete, only: [:insert_and_delete]

  def insert_and_delete
    Entry.create(id: @entry_id, content_id: @content.id, user_id: @user.id)
    redirect_to root_path
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
        #binding.pry
        if Content.find(entry.content_id).start_at === @content.start_at && entry.user_id.to_s === params[:user_id] then
          @entry_id = entry.id
          entry.destroy!
        end
      end
    end
end
