# encoding: utf-8
# コマンド rake user:set_admin

namespace :user do

  # 指定ユーザに管理者権限を追加する
  desc "Add administrator authority to user."
  task set_admin: :environment do
    begin
      raise "ENV['USER_EMAIL'] is not found." unless ENV['USER_EMAIL']
      email = ENV['USER_EMAIL']
      user = User.where(email: email).first
      raise "user is not found." if user.blank?
      user.admin = true
      puts "OK, #{user.name} is administrator!#{user.admin}" if user.save
    end
  end
end
