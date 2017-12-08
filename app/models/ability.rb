class Ability
  include CanCan::Ability

  def initialize(user)
     if user.role == 'super_admin'
       can :manager, :all
     elsif user.role == 'admin'
       can :manager, Site
       can :manager, Navbar
       can :manager, Footer
     elsif
       can :read, Site
     end 
  end
end
