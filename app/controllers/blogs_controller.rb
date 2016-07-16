class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:edit, :update, :destroy]
    def index
        @blogs=Blog.all
    end
    
    def new
        # binding.pry
        if params[:blog] && params[:back]
            @blog=Blog.new(blogs_params)
        else
            @blog=Blog.new
            @blog.user_id=current_user.id
        end
    end
    
    def create
        # Blog.create(blogs_params)
        @blog=Blog.new(blogs_params)
        @blog.user_id=current_user.id
        if @blog.save
            redirect_to blogs_path, notice: "新規投稿しました"
        else
          render :action => "new"
        # redirect_to :action => "new":drops the information of @blog
        end
    end
    
    def confirm
        @blog=Blog.new(blogs_params)
        if @blog.invalid?
            render :new
        end
    end
    
    def edit
        @blog=Blog.find(params[:id])
    end
    
    def update
        @blog=Blog.find(params[:id])
        if @blog.update(blogs_params)
            # redirect_to :action => "index", notice: "update, done!"は何故か機能しない
            redirect_to blogs_path, notice: "投稿を変更しました"
        else
            render :action => "edit"
        end
        
    end
    
    def destroy
        @blog=Blog.find(params[:id])
        @blog.destroy
        redirect_to "/blogs", notice: "投稿を削除しました"
    end
    
    def show
        @blog=Blog.find(params[:id])
    end
    
    private
    def blogs_params
        params.require(:blog).permit(:title,:content,:user_id)
    end
    
    def set_blog
        @blog=Blog.find(params[:id])
    end
end
