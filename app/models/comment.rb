class Comment < ActiveRecord::Base
    # Comment는 Post에 속한다
    belongs_to :post
end
