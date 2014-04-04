class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

  default_scope -> { order("created_at DESC") }
end
