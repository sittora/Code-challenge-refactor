class User < ActiveRecord::Base
    has_many :products
    has_many :reviews, through: :products

    #     - `User#reviews`
    #   - returns a collection of all the Reviews that the User has given
    def reviews
    end

    # - `User#products`
    #   - returns a collection of all the Products that the User has reviewed
    def products
    end

end