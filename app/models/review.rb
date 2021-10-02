class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

#     - `Review#print_review`
#   - should `puts` to the terminal a string formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`
    def print_review
        my_product = Product.find_by(id: self.product_id)
        my_user = User.find_by(id: self.user_id)
        "Review for #{my_product.name} by #{my_user.name}: #{self.star_rating}. #{self.comment}"
    end

end