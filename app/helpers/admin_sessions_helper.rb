module AdminSessionsHelper
  
  #ゲスト管理者を定義　※管理者と区別
  def admin_guest_user
  　user=User.find_by(email:'admin-guest@email.com')
  end
  

  def admin_guest_user?(user)
    user==admin_guest_user
  end
end 

  

