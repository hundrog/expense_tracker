# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all, user: user

    # this can be helpfull in case we have user tiers or roles
    # return unless user.premium?
    # can :manage, :all, user: user
  end
end
