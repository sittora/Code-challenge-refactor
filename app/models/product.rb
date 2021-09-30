class Product < ActiveRecord::Base
    has_many :reviews

    #     - `Product#reviews`
    #   - returns a collection of all the Reviews for the Product
    def reviews
        Review.where(product_id: self.id)
    end

    # - `Product#users`
    #   - returns a collection of all the Users who reviewed the Product
    def users
        reviews = Review.where(product_id: self.id)
        users = reviews.map{|review| User.find_by(id: review.user_id) }
    end
end