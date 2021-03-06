class RegistrationsController < Devise::RegistrationsController

private

  def sign_up_params
    params.require(:user).permit(:first_name, 
                                 :last_name, 
                                 :avatar,
                                 :email, 
                                 :password, 
                                 :password_confirmation,
                                 :email_confirmation, 
                                 :username)
  end

  def account_update_params
    params.require(:user).permit(:first_name, 
                                 :last_name,
                                 :avatar, 
                                 :email, 
                                 :password, 
                                 :password_confirmation, 
                                 :email_confirmation, 
                                 :current_password, 
                                 :username)
  end

end