class Comment < ActiveRecord::Base
  has_paper_trail class_name: "PaperVersion"
  has_paper_trail on: [:create]
  belongs_to :user
  belongs_to :review
  validates :content, presence: true
end
