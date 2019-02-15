class Book < ApplicationRecord
  belongs_to :collection, optional: true
  belongs_to :category
  has_many :reviews
  has_many :likes

  has_many :comments, as: :commentable

  validates_presence_of :description, :title



end
