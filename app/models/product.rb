class Product < ActiveRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    def reviews
        Review.where(product_id: self.id)
    end

    def users
        self.reviews.map do |review|
            review.user
        end
    end

    def leave_review(user, comment, star_rating)
        Review.create(user_id: user.id, product_id: self.id, comment: comment, star_rating: star_rating)
    end



    def print_all_reviews
        self.reviews.each do |review|
            puts "Review for #{self.name} by #{review.user.name}: #{review.star_rating} . #{review.comment}"
        end
    end

    def average_rating
        if self.reviews.count == 0
            return 0
        else
        sum = 0
        self.reviews.each do |review|
            sum += review.star_rating
        end
        sum / self.reviews.count
        end
    end
end