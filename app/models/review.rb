class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    #     - `Review#user`
    #   - returns the `User` instance for this Review
    def user
        user = User.find_by(id: self.user_id)
        user.name
    end

    # - `Review#product`
    #   - returns the `Product` instance for this Review
    def product
        product = Product.find_by(id: self.user_id)
        product.name
    end

end