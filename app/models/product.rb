class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    #     - `Product#leave_review(user, star_rating, comment)`
    #   - takes a `User` (an instance of the `User` class), a `star_rating` (integer), and a `comment` (string) as arguments, and creates a new `Review` in the database associated with this Product and the User
    def leave_review(user, star_rating, comment)
        Review.create(comment: comment, star_rating: star_rating, product_id: self.id, user_id: user.id)
        self.save
    end

    # - `Product#print_all_reviews`
    #   - should `puts` to the terminal a string representing each review for this product
    #   - each review should be formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`
    def print_all_reviews
        self.reviews.each { |review|
            puts review.print_review
        }
    end

    # - `Product#average_rating`
    #   - returns a `float` representing the average star rating for all reviews for this product
    def average_rating
        reviews.average(:star_rating).to_f
    end
end