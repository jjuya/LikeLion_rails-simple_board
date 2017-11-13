class Post < ActiveRecord::Base
    # Post는 User에 속한다.
    belongs_to :user
    
    # Post는 comments를 가지고 있다.
    has_many :comments
end
