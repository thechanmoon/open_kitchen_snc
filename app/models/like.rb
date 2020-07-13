class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def self.total_count
        Like.all.count
    end
end
