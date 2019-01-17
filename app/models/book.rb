class Book < ApplicationRecord
  belongs_to :series, optional: true

   validates_presence_of :description, :title
end
