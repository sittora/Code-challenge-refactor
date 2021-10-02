class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

#     - `Review#print_review`
#   - should `puts` to the terminal a string formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`
    def print_review
        "Review for #{product.name} by #{user.name}: #{self.star_rating}. #{self.comment}"
    end

end