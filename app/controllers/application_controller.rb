class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include GuestSessionsHelper
  
  def set_user
     @user=User.find(params[:id])
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger]="ログインしてしてください。"
      redirect_to login_url
    end
  end
      
  def correct_user
    unless current_user?(@user)
    flash[:danger]="権限がありません。"
    redirect_to(root_url)
    end
  end
  
  
  def adminright_user
    redirect_to root_url unless current_user.admin?
  end
  
  
  def adminright_or_correct_user
    @user=User.find(params[:id]) if @user.blank?
    unless current_user?(@user) || current_user.admin?
     flash[:danger]="見る権限がありません。"
     redirect_to(root_url)
    end
  end
  
  
  def limitation_login_user
    if logged_in?
    flash[:info]="すでにログインしています。"
    redirect_to root_url
    end
  end
  
  
  def limitation_not_admin_user
    unless current_user.admin?
    flash[:info]="すでにログインしています。"
    redirect_to current_user
    end
  end
  
    
end

  
