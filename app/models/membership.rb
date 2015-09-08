class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  
  validates :user, uniqueness: {scope: :idea}
  
  def user_name
    if user
      user.full_name
    else
      "Anonymous"
    end
  end 
    
end
