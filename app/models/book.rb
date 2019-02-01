class Book < ApplicationRecord
  belongs_to :series, optional: true
  belongs_to :category

   validates_presence_of :description, :title
end
