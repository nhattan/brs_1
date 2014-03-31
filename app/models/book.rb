class Book < ActiveRecord::Base
  RATINGS = ['', 1, 2, 3, 4, 5]
  
  validates :category_id, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :page, presence: true, numericality: {greater_than: 0}
  validates :author, presence: true
  validates :published_at, presence: true

  belongs_to :category

  def self.search(params)
    books = order('created_at DESC')
    books = where('title LIKE ?', "%#{params[:title]}%") if params[:title].present?
    books = books.where('category_id = ?', 
      params[:category_id]) if params[:category_id].present?
    books = books.where('rating = ?', params[:rating]) if params[:rating].present?
    books
  end
end