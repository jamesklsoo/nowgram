class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def new
        @post = Post.new
    end
    
    def create
       
        @post = Post.new(create_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    

    private

    def create_params
        params.require(:post).permit(:caption, {images: []})
    end
    
    def find_post
        @post = Post.find(params[:id])
    end
    
end


