class UserBook < ActiveRecord::Base
  has_paper_trail class_name: "PaperVersion"
  has_paper_trail on: [:create, :update]
  has_paper_trail only: [:read, :favorite]
  belongs_to :user
  belongs_to :book

  default_scope -> { order("created_at DESC") }
  scope :favorite, -> { where(favorite: 1) }
  scope :history, -> { where("read = ? OR reading = ?", 1, 1) }
  scope :requested, -> { where(request: 1) }

  def read?
    read == 1
  end

  def favorite?
    favorite == 1
  end

  def request?
    request == 1
  end
end
