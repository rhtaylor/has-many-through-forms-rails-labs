class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
   accepts_nested_attributes_for  :user, :post

def user=(new_user)
    user = User.find_or_create_by(username: new_user) 
    user
  end 

 

  end

