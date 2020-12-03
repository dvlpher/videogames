class ApplicationController < ActionController::Base

    private
    
        def check_for_logged_in
            redirect_to '/' if !logged_in?
          end

end
 