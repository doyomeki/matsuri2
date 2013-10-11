require_relative '../../spec_helper'
require 'rake'

describe "user" do
  before :all do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require "lib/tasks/set_data", [Rails.root.to_s]
    Rake::Task.define_task(:environment)
  end

  describe "user:set_admin" do
    context "Rakeタスクを実行した場合" do
      subject(:user) { FactoryGirl.create(:user) }

      context "オプションを指定しない場合" do
        it "エラーメッセージが表示されること" do
          Rake::Task["user:set_admin"].reenable
          expect {@rake.invoke_task "user:set_admin"}.to raise_error
        end
      end

      context "オプションを指定した場合" do
        context "ユーザーが存在していない場合" do
          it "エラーメッセージが表示されること" do
            Rake::Task["user:set_admin"].reenable
            ENV['USER_EMAIL'] = "sample"
            expect {@rake.invoke_task "user:set_admin"}.to raise_error
         end
        end

        context "ユーザーが存在している場合" do
          before do
            Rake::Task["user:set_admin"].reenable
            ENV['USER_EMAIL'] = user.email
          end

          it "エラーメッセージが表示されないこと" do
            expect {@rake.invoke_task "user:set_admin"}.not_to raise_error
          end

          it "該当ユーザーが管理者になっていること" do
            @rake.invoke_task "user:set_admin"
            expect(User.where(email: user.email).first.admin).to be_true
          end
        end
      end
    end
  end
end
