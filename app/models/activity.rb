class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :object, polymorphic: true

  default_scope{ order('created_at DESC') }

  def creating?
    self.event == "create"
  end

  def updating?
    self.event == "update"
  end

  def followed?
    creating? && self.object_type == "Relationship"
  end

  def commented?
    creating? && self.object_type == "Comment"
  end

  def reviewed?
    creating? && self.object_type == "Review"
  end

  def marked?
    (creating? || updating?) && self.object_type == "UserBook"
  end

  scope :filter, lambda { |user|
    followed_ids = "SELECT followed_id FROM relationships 
      WHERE follower_id = :user_id"
    Activity.where("user_id IN (#{followed_ids}) OR user_id = :user_id", 
      user_id: user.id)
  }
end
