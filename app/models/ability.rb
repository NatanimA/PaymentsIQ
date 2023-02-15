# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end
