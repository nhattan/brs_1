class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  default_scope -> { order("created_at DESC") }
end
