class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      #do smthg
    else
      if user.admin?
        can :manage, :all
      end
      if user.writer?
        default_user(user)
      end
      if user.role.nil?
        default_user(user)
      end
    end
  end

  def default_user(user)
    can :manage, User, id: user.id
  end
end
