class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    # - `User#favorite_product`
    #   - returns the product instance that has the highest star rating from this user
    def favorite_product
        highest_review = reviews.order("star_rating DESC").first
        Product.where(id: highest_review.product_id)
    end

    #   - `User#remove_reviews(product)`
    #     - takes a `Product` (an instance of the `Product` class) and removes _all_ of this user's reviews for that product
    #     - you will have to delete any rows from the `reviews` table associated with this user and the product
    def remove_reviews(product)
        Review.where(user_id: self.id, product_id: product.id).destroy_all
        self.save
    end
end