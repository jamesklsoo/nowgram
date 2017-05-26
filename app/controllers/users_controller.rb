class UsersController < ApplicationController

    def index
        @user = User.new
    end
    
    
    def new
        @user = User.new
    end
    
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User has been created"
            redirect_to root_path
        else
            flash[:error] = "Invalid input"
            render :new
        end
    end

    def login
        @user = User.find_by_email(params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:user] = @user.id
            redirect_to root_path
        else
            flash[:alert] = "Wrong email or password"
            render :login
        end
    end

    def logout
        session[:user] = nil
        redirect_to root_path
    end
    
        

    private

    def user_params
        params.require(:user).permit(:email, :fullname, :username, :password)
    end
    
    
end
