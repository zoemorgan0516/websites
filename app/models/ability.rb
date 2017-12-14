class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.super?
      can :manage, Site
      can :manage, User
    elsif user.role == 'admin'
      can [:update, :read], Site
      can :manage, User
      can :manage, Category
      can :manage, Advantage
      can :manage, Content
      can :manage, Cooperation
      can :manage, SliderPicture
    elsif user.role == 'user'
      alias_action :read, :to => :welcome
      can :read, Site
    end
  end
end
