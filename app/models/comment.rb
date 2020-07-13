class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    def self.total_count
        Comment.all.count
    end

    def character_counts
        message.length
        # message.count
    end

end
