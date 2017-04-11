class Ability
  include CanCan::Ability

  def initialize(user)

    @user = user || User.new # for guest users
    # for each of the roles, call the method which gives its permissions
    @user.roles.each { |role| send(role) }

    if @user.roles.size == 0
        can :read, :all
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  # Readers can read any object, but can't modify anything.
  def reader
    can :read, :all
  end

  # Contributors can read anything
  #   and also see the dashboard
  #   and can manage data.
  # Probably want a controller for finer grain
  #   determination about user trustworthiness
  #   when deciding whose input data to use
  def contributor
    reader
    can :dashboard            # allow access to dashboard
    can :access, :rails_admin
    can :manage, Post
  end

  # Administrators can do anything.
  def admin
    can :manage, :all   
  end

end
