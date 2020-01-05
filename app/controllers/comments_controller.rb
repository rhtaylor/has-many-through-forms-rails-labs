class CommentsController < ApplicationController

  def create 
    
    comment = Comment.create(comment_params.each{ |k,v| 
    
        if k == "user_id" && v.blank?  
        
           @user = User.find_or_create_by(username: params['comment']['user']) 
        end })
      if comment.user_id.blank?
      comment.user_id = @user.id  
      comment.save 
    
      end
     redirect_to comment.post
  end

  def update 
    
  end
  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user:[] )
  end 
  
  
end
