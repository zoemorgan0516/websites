class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new
     if user.role == 'super_admin'
       can :manage, :all
     elsif user.role == 'admin'
       can :manage, Site
       can :manage, Navbar
       can :manage, Footer
       can :read, :all
     elsif
       can :read, Site
     end
  end
end
