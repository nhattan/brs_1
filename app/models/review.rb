class Review < ActiveRecord::Base
  has_paper_trail class_name: "PaperVersion"
  has_paper_trail on: [:create]
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

  default_scope -> { order("created_at DESC") }
end
