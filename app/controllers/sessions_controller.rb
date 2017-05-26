class SessionsController < ApplicationController


    def new
    end
    
    def create
        @user = User.find_by(email: params[:email])
            # If the user exists AND the password entered is correct.
        if @user && @user.authenticate(params[:password])
            # Save the user id inside the browser cookie. This is how we keep the user 
            # logged in when they navigate around our website.
            session[:user] = @user.id
            redirect_to '/', notice: "Signed in!"
        else
            # If user's login doesn't work, send them back to the login form.
            redirect_to '/login'
        end
    end


    def destroy
        #clear out session    
        reset_session
        redirect_to '/login', notice: "Signed out!"
    end

#   def failure
#     redirect_to '/login', alert: "Authentication failed, please try again."
#   end

end

