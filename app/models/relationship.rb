class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  after_create :create_activities
  after_destroy :destroy_activities

  private
    def create_activities
      Activity.create(object: self, user: follower, event: "create")
      Activity.create(object: self, user: followed, event: "create")
    end

    def destroy_activities
      Activity.find_by(object: self, user: follower).destroy
      Activity.find_by(object: self, user: followed).destroy
    end
end
