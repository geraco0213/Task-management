class AdminSessionsController < ApplicationController
  
  def create
    user=User.find_or_create_by(email:'admin-guest@email.com') do |user|
      user.password=SecureRandom.urlsafe_base64
      user.name="ゲスト管理者"
    end
    session[:user_id]=user.id
    flash[:success]="ゲスト管理者としてログインしました。"
    redirect_to user
  end
  
end
