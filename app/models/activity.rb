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

  def follow?
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
end
