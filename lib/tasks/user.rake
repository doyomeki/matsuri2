# encoding: utf-8
# コマンド rake user:set_admin

namespace :user do

  # 指定ユーザに管理者権限を追加する
  desc "Add administrator authority to user."
  task set_admin: :environment do
    begin
      raise "ENV['USER_ID'] is not found." unless ENV['USER_ID'] or ENV['USER_PASSWORD']
      code = ENV['USER_ID']
      password = ENV['USER_PASSWORD']
      user = User.where(code: code).first
      raise "user is not found." if user.blank?
      user.admin = true
      user.password = password
      if user.save
        puts "OK, #{user.code} is administrator!"
      else
        p "#{user.errors.full_messages}"
      end
    end
  end
end
