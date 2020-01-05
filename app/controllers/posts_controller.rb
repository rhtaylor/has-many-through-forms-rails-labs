class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id]) 
    @comment = @post.comments.build(content: nil) 

    
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new 
    @post.categories.build(name: nil) 
    @post.users.build(username: nil)
  end

  def create  
    
    post = Post.create(post_params)
    
    redirect_to post
  end

  def update 
    
    @post = Post.find(params[:id])
    @post.comments.update(post_params)
    redirect_to post_path(@post)
  end 



  private

  def post_params 
    
    unless params["post"]["categories_attributes"].values.first.values.first.empty?
          @category = Category.find_or_create_by( name:  params["post"]["categories_attributes"].values.first.values.first ) 
          params["post"]["category_ids"] << @category.id   
        end                                        
   
    params.require(:post).permit(:title, :content, category_ids:[])
  end
end
