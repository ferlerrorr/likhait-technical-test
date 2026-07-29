class Category < ApplicationRecord
  has_many :expenses, dependent: :destroy

  # FEATURE-001: categories.name carries a unique index, so without these a duplicate POST raises
  # ActiveRecord::RecordNotUnique and returns 500 instead of a 422 the modal can display.
  validates :name, presence: true, uniqueness: true
end
