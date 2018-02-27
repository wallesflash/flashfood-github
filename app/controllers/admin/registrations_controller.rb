class Admin
    class RegistrationsController < Devise::RegistrationsController
      layout "admin"

      private

        def sign_up_params
          params.require(:admin).permit(:name, :surename, :admin_nick, :email, :password, :password_confirmation)
        end
        def account_update_params
          params.require(:admin).permit(:name, :surename, :admin_nick, :email, :password, :password_confirmation, :current_password)
        end

    end
end
