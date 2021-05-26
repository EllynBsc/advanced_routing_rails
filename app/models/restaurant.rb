class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # whenever i delete a restaurant instance, i also want to delete all the reviews attached to it

  # self.reviews ....
end
