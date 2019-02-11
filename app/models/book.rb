class Book < ApplicationRecord
  belongs_to :series, optional: true
  belongs_to :category
  has_many :reviews
  has_many :likes

  validates_presence_of :description, :title
end
