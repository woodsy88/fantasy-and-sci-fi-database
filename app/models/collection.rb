class Collection < ApplicationRecord
  has_many :books

  has_many :comments, as: :commentable
end
