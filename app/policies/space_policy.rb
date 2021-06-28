class SpacePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def paths?
    true
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
