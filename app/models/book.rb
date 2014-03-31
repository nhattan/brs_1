class Book < ActiveRecord::Base
  validates :category_id, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :page, presence: true, numericality: {greater_than: 0}
  validates :author, presence: true
  validates :published_at, presence: true

  belongs_to :category
end