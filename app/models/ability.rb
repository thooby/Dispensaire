class Ability
  include CanCan::Ability
  def initialize(user)   
    user ||= User.new # guest user (not logged in)
    if user.role == "admin"
      can :manage, :all
      can :assign_roles, User
    elsif user.role == "visiteur"
      can :find, ConsulDiag
    elsif user.role == "chercheur"
      can :read, Patient
      can :read, Consultation
      can :read, ConsulDiag
      can :read, ConsulTrat
      can :find, ConsulDiag
    elsif user.role == "sanitaire"
      can :manage, Patient 
      cannot :destroy, Patient 
      can :manage, User
    elsif user.role == "local_admin"      
      can :assign_roles, User
      can :manage, :all
      cannot :manage, ConsulDiag
      cannot :manage, ConsulTrat 
      cannot :manage, Diagnostic
      cannot :manage, Traitement 
      can :read, ConsulDiag
      can :read, ConsulTrat
      can :read, Diagnostic
      can :read, Traitement
    else            
      can :read, :all
    end
  end
end
