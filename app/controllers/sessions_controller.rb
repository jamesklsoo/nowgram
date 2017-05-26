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
            redirect_to root_path, notice: "Signed in!"
        else
            # If user's login doesn't work, send them back to the login form.
            render :new
        end
    end


    def destroy
        #clear out session    
        reset_session
        redirect_to login_path, notice: "Signed out!"
    end
end

