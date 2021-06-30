class SpacePolicy < ApplicationPolicy

  def index?
    is_admin?
  end

  def show?
    true
  end

  def new?
    is_admin?
  end

  def edit?
    is_admin?
  end

  def create?
    is_admin?
  end

  def update?
    is_admin?
  end

  def destroy?
    is_admin?
  end

  private

  def is_admin?
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
