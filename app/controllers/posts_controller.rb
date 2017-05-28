class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all 
    end
    

    def new
        @post = Post.new
    end
    
    def create
       
        @post = Post.new(create_params)
        @post.user_id = current_user.id
        @post.time = Time.now
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
        @post.update(update_params)
        if @post.save
            redirect_to @post
        else
            render :edit
        end
    end
    
    def destroy
    end
    

    private

    def create_params
        params.require(:post).permit(:caption, {images: []})
    end
    
    def update_params
        params.require(:post).permit(:caption)
    end
    

    def find_post
        @post = Post.find(params[:id])
    end
    
end


