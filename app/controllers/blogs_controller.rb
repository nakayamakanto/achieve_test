class BlogsController < ApplicationController
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
        end
    end
    
    def create
        # Blog.create(blogs_params)
        @blog=Blog.new(blogs_params)
        if @blog.save
            redirect_to blogs_path, notice: "new blog, done!"
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
        # @blog=Blog.find(params[:id])
    end
    
    def update
        # @blog=Blog.find(params[:id])
        if @blog.update(blogs_params)
            # redirect_to :action => "index", notice: "update, done!"は何故か機能しない
            redirect_to blogs_path, notice: "update, done!"
        else
            render :action => "edit"
        end
        
    end
    
    def destroy
        # @blog=Blog.find(params[:id])
        @blog.destroy
        redirect_to "/blogs", notice: "delete, done!"
    end
    
    private
    def blogs_params
        params.require(:blog).permit(:title,:content)
    end
    
    def set_blog
        @blog=Blog.find(params[:id])
    end
end
