class Restaurant < ApplicationRecord
    has_many :posts

    def self.total_count
        Restaurant.all.count
    end

    def self.restaurants_with_posts
        count = 0
        Restaurant.all.each do |restaurant|
            if restaurant.posts != []
                count += 1
            end
        end
        return count
    end
end

# def self.restaurants_with_posts_comments
#     count = 0
#     Restaurant.all.each do |restaurant|
#         if restaurant.posts != []
#             restaurant.posts.each do |post|
#                 if post.comments != [comment]
#                 count += 1
#                 end
#             end   
#         end
    
#     end
#     return count
# end
