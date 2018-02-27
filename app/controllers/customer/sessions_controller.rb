class Customer
    class SessionsController < Devise::SessionsController
      layout "client_panel"

      def after_sign_in_path_for(resource)
        customer_root_path
      end
      def after_sign_out_path_for(resource)
        new_customer_session_path
      end

    end
end
