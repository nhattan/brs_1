class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

  default_scope -> { order("created_at DESC") }
  after_create :create_activity

  private
    def create_activity
      Activity.create(object: self, object_id: self.id, user: user, 
        event: "create")
    end
end
