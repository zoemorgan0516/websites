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
<<<<<<< HEAD
      can :manage, Article 
=======
      can :manage, Email
>>>>>>> 17f547689cf580377f48636b3fcc30c0817b3885
      can :manage, Category
      can :manage, ContentsClass
      can :manage, Content
    elsif user.role == 'user'
      alias_action :read, :to => :welcome
      can :read, Site
    end
  end
end
