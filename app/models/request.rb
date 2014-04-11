class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true

  def accepted?
    accept == 1
  end

  def canceled?
    accept == 0
  end
end