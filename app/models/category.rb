class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :books, dependent: :destroy
end
