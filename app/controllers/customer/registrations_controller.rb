class Customer
    class RegistrationsController < Devise::RegistrationsController
      layout "client_panel"
      private

        def sign_up_params
          params.require(:customer).permit(:name, :surename, :customer_nick, :phone_no, :email, :password, :password_confirmation)
        end
        def account_update_params
          params.require(:customer).permit(:name, :surename, :customer_nick, :phone_no, :email, :password, :password_confirmation, :current_password)
        end

    end
end
