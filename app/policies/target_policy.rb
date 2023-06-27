class TargetPolicy < ApplicationPolicy
  def create?
    @user
  end
end
