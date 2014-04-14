class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  validates :content, presence: true
  after_create :create_activity

  private
    def create_activity
      Activity.create(object: self, user: user, event: "create")
    end
end
