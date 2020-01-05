class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments 
 accepts_nested_attributes_for  :comments, :posts

def user=(new_user)
    user = User.find_or_create_by(username: new_user) 
    user
  end

end
