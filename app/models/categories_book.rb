class CategoriesBook < ApplicationRecord
  belongs_to :category_book
  belongs_to :book
end
