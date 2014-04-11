class Book < ActiveRecord::Base
  RATINGS = [1, 2, 3, 4, 5]
  validates :category_id, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :page, presence: true, numericality: {greater_than: 0}
  validates :author, presence: true
  validates :published_at, presence: true

  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :user_books, dependent: :destroy
  has_many :requests, dependent: :destroy
end