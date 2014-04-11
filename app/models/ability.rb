class Ability
  include CanCan::Ability

  def initialize(user_or_admin)
    alias_action :create, :read, :update, :destroy, to: :crud

    if user_or_admin.is_a? Admin
      admin_rules(user_or_admin)
    elsif user_or_admin.is_a? User
      user_rules(user_or_admin)
    else
      common_rules(user_or_admin)
    end
  end

  def common_rules(user_or_admin)
    can :read, :all
  end

  def admin_rules(admin)
    can :manage, :all
  end

  def user_rules(user)
    can :read, :all
    can :crud, [User, UserBook, Review, Comment, Activity]
    can [:create, :destroy], Request
  end
end