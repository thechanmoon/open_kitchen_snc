class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :posts, through: :comments
    validates :email, uniqueness: true
    has_many :likes
    has_many :posts, through: :likes
    def name 
        first_name + ' ' + last_name 
    end

    def self.user_all
        User.all
    end

    def comment_by_user
        comments.count
    end
    
    def user_created
        created_at
    end

    def user_updated
        updated_at
    end
    
    def name_and_comments()
        "#{name} has "+ ActionController::Base.helpers.pluralize(comment_by_user, "comment")
    end

    def restaurant_owner()
        if is_owner
        "#{name} is an owner "
        else
        "#{name} is not an owner"
        end
    end

    def account_created
        "User created account on #{created_at}"
    end


    def account_updated
        "User updated account on #{updated_at}"
    end

    def character_counts
        # comments.map do |comment|
        #     comment.character_counts
        # end.inject { |sum, n| sum + n } 
        
        comments.length > 0 ? comments.map do |comment|
            comment.character_counts
        end.inject { |sum, n| sum + n } : 0 
    
    end

    def character_count_avg
        # if comments && character_counts
        #     character_counts / comments.length
        # else
        #     0
        # end
        character_counts > 0 ? character_counts / comments.length : 0
    end

    def likes_counts
        posts.length > 0 ? posts.map do |post|
            post.likes_count
        end.inject { |sum, n| sum + n } : 0 
    end

    def likes?(post)

        post.likes.where(user_id: id).any?
      
      end
end
