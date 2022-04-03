module AdminSessionsHelper
  
#一応、定義しておくが、多分使う場面ない
  def admin_guest_user
  　user=User.find_by(email:'admin-guest@email.com')
  end
  

  def admin_guest_user?(user)
    user==admin_guest_user
  end
end 

  

