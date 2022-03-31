class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
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
    redirect_to(root_url) unless current_user?(@user)
  end
  
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  
  def admin_or_correct_user
    @user=User.find(params[:id]) if @user.blank?
    unless current_user?(@user) || current_user.admin?
     flash[:danger]="見る権限がありません。"
     redirect_to(root_url)
    end
  end
  
  
  
  def guest_user
    current_user==User.find_by(email: 'test@example.com')
  end 
  
  def login_required
    redirect_to login_url unless current_user
  end
    
end

  
