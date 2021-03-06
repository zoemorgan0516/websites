class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.super?
      can :manage, Site
      can :manage, User
    elsif user.role == 'admin'
      can [:update, :read], Site
      can [:update, :read], User
      can :manage, Article
      can :manage, Email
      can :manage, Category
      can :manage, ContentsClass
      can :manage, Content
      can :manage, SliderPicture
      can :manage, Advantage
      can :manage, Cooperation
    elsif user.role == 'user'
      alias_action :read, :to => :welcome
      can :read, Site
    end
  end
end
