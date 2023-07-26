class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, Post
    # can :read, Comment
    can :create, Comment

    if user.present?
      case user.role

        when "Admin"
          can :read, Comment
          can :create, Comment
          can :destroy, Comment

          can :read, Profile
          can :create, Profile
          can :destroy, Profile
          
          can :approv_accounts, Profile
          can :confirm_approve, Profile

          can :read, Comment
          can :create, Comment
          can :destroy, Comment

        when "Preciousian"
          can :read, Comment
          can :create, Comment
          can :destroy, Comment

          can :read, Profile
          can :create, Profile
          can :destroy, Profile        

          cannot :approv_accounts, Profile
          cannot :confirm_approve, Profile
          
          can :read, Comment
          can :create, Comment
          can :destroy, Comment

        when "NonPreciousian"
          can :read, Post

          can :read, Profile
          can :create, Profile
          can :destroy, Profile 

          cannot :approv_accounts, Profile
          cannot :confirm_approve, Profile
          
        end
      end
    end
  end