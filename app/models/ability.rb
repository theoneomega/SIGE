class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    @user = User.find_by_id(user.id)
    unless @user.blank?

      if @user.role.super_admin
        can :manage, :all
      elsif @user.role.administrator
        can [:index, :show, :edit, :create, :update, :read, :modify, :not_assigned, :working, :standby, :waiting, :replied], Office
        can [:read, :show], Search
        can [:finish, :send, :reply, :save, :assign], Office


        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id

      elsif @user.role.analysts_supervisor and @user.role.analyst
        can [:index, :create, :new, :update, :edit, :show], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot

        can :index, HistoricalArchive
        can [:index, :show, :create], Investigation
        can [:edit, :update], Investigation, :analyst_id => @user.analyst_id
        can [:show, :create, :modify, :finish], JusticeNet
        can [:index, :edit, :read, :update], JusticeNet, :analyst_id => @user.analyst_id
        can [:finish,  :nofinish, :modify], Office
        can [:show, :nofinish, :finish, :modify], Colaboration
        can [:read, :show], Search
        can [:show, :create], Event
        can [:index, :edit, :read, :update], Event, :analyst_id => @user.analyst_id
        can [:index, :edit, :read, :update], Colaboration, :analyst_id => @user.analyst_id
        can [:index, :edit, :read, :update], Office, :analyst_id => @user.analyst_id
        can [:update], OfficeFile, :user_id => @user.id
        can [:read, :show], EventsCollection

      elsif @user.role.iph_supervisor
        can :index, HistoricalArchive
        can [:index, :show, :create], Investigation
        can [:edit, :update], Investigation, :analyst_id => @user.analyst_id
        can [:show, :create, :modify, :finish], JusticeNet
        can [:index, :edit, :read, :update], JusticeNet, :analyst_id => @user.analyst_id
        can [:index, :show, :edit, :create, :update, :read,:modify, :finish,  :nofinish, :send, :waiting, :replied], Office
        can [:show, :nofinish, :finish, :modify], Colaboration
        can [:read, :show], Search
        can [:index, :show, :create], Event
        can [:edit, :read, :update], Event, :analyst_id => @user.analyst_id

        can [:index, :edit, :read, :update], Colaboration, :analyst_id => @user.analyst_id
        can [:index, :edit, :read, :update], Office, :analyst_id => @user.analyst_id


        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot
      elsif @user.role.supervisor
        can :index, HistoricalArchive
        can :index, Statistic
        can [:index, :show, :create], Investigation
        can [:edit, :update], Investigation, :analyst_id => @user.analyst_id
        can [:read, :update, :show], Event
        can [:read, :update, :show, :index, :refuse, :assign, :approve, :standby, :working, :not_assigned], Office
        can [:read, :show], EventsCollection
        can [:read, :show], Search
        can [:index, :read, :create, :approve, :update, :assign, :save, :finish, :send, :send_colaboration, :sendit, :register], Colaboration
        can :send, Colaboration if @user.analyst.area.description == "NORTE"
        can [:index, :show, :update, :assign_net, :approve_net], JusticeNet
        can :create, Colaboration
        can [:machin], Colaboration


        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot
      elsif @user.role.super_supervisor
        can :index, HistoricalArchive
        can :index, Statistic
        can [:index, :show, :create], Investigation
        can [:edit, :update], Investigation, :analyst_id => @user.analyst_id
        can [:read, :show], Search
        can [:read, :update, :index, :show, :create], Event
        can [:read, :create, :update, :index], Office
        can [:read, :show], EventsCollection
        can :observe, Activity
        can [:read, :create, :update, :index], Iph
        can [:machin, :read, :show, :update], Colaboration


        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot

      elsif @user.role.ie_supervisor
        can :index, HistoricalArchive
        can :index, Statistic
        can [:index, :show, :create], Investigation
        can [:edit, :update], Investigation, :analyst_id => @user.analyst_id
        can :manage, JusticeNet
        cannot :delete, JusticeNet
        can [:read, :create, :update, :index, :assign, :approve, :working, :standby, :waiting, :replied, :not_assigned], Office
        can [:read, :show], Search
        can [:read, :show, :edit, :update, :approve], Event
        can [:read, :show], EventsCollection
        can [:machin], Colaboration
        can [:index, :read, :create, :approve, :update, :assign, :save, :finish, :send, :send_colaboration, :sendit, :register], Colaboration
        can :manage, Iph


        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot
      elsif @user.role.medios
        can :index, HistoricalArchive
        can [:read, :show], Search
        can [:read, :update], Event, :analyst_id => @user.analyst_id
        can [:read,:create,:edit,:update], Event
        can [:read, :show], EventsCollection

        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot
      elsif @user.role.analyst
        can :index, HistoricalArchive
        can [:index, :show, :create], Investigation
        can [:edit, :update], Investigation, :analyst_id => @user.analyst_id
        can [:show, :create, :modify, :finish], JusticeNet
        can [:index, :edit, :read, :update], JusticeNet, :analyst_id => @user.analyst_id

        can [:finish,  :nofinish, :modify, :show], Office
        can [:index, :edit, :read, :update], Office, :analyst_id => @user.analyst_id

        can [:show, :nofinish, :finish, :modify], Colaboration
        can [:read, :show], Search
        can [:show, :create], Event
        can [:index, :edit, :read, :update], Event, :analyst_id => @user.analyst_id
        can [:index, :edit, :read, :update], Colaboration, :analyst_id => @user.analyst_id

        can [:update], OfficeFile, :user_id => @user.id
        can [:read, :show], EventsCollection

        can [:index, :create, :new, :edit, :update], Helpdesk
        can [:finish_report], Helpdesk, :analyst_id => @user.analyst_id
        can [:show], Helpdesk, :analyst_id => @user.analyst_id
        can [:create, :new], HelpdeskAction
        can [:create, :new], HelpdeskScreenshot
      end

    end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end