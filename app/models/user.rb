class User < ActiveRecord::Base
    has_many :products
    has_many :reviews, through: :products

    #     - `User#reviews`
    #   - returns a collection of all the Reviews that the User has given
    def reviews
        Review.where(user_id: self.id)
    end

    # - `User#products`
    #   - returns a collection of all the Products that the User has reviewed
    def products
        reviews = Review.where(user_id: self.id)
        reviews.map{|review| Product.find_by(id: review.product_id) }
    end

    # - `User#favorite_product`
    #   - returns the product instance that has the highest star rating from this user
    def favorite_product
        reviews = self.reviews
        highest_rating = 0
        best_review = nil
        reviews.map{ |review| 
            if review.star_rating > highest_rating
                best_review = review
                highest_rating = review.star_rating
            end
        }

        Product.where(id: best_review.product_id)
    end

    #   - `User#remove_reviews(product)`
    #     - takes a `Product` (an instance of the `Product` class) and removes _all_ of this user's reviews for that product
    #     - you will have to delete any rows from the `reviews` table associated with this user and the product
    def remove_reviews(product)
        reviews = Review.where(product_id: product.id)
        reviews.map{|review| 
            if review.user_id == self.id
              Review.destroy(review.id)
            end
        }
    end
end