class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update]

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

    def show
    end
    
    def update
    end
    
        

    private

    def user_params
        params.require(:user).permit(:email, :fullname, :username, :password)
    end
    
    def update_params
        #need to add website and other instagrams options in table
        params.require(:user).permit(:email, :fullname, :username, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
    
    
end
