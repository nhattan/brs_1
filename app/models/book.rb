class Book < ActiveRecord::Base
  validates :category_id, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :page, presence: true
  validates :author, presence: true

  belongs_to :category
end