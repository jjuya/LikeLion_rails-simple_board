class User < ActiveRecord::Base
    # User는 Posts를 가지고 있다.
    has_many :posts
end
