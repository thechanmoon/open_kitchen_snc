class Post < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    belongs_to :restaurant

    has_many :likes
    has_many :users, through: :likes

    def self.total_count
        Post.all.count
    end

    def likes_count
        likes.length
    end

    def self.comment_count
        Post.all.length > 0 ? Post.all.map do |post|
            post.comments.length
        end.inject { |sum, n| sum + n } : 0 
    end    
end
