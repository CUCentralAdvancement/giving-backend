class FundPolicy < ApplicationPolicy

  def index?
    is_fund_manager?
  end

  def paths?
    true
  end

  def show?
    true
  end

  def new?
    is_fund_manager?
  end

  def edit?
    is_fund_manager?
  end

  def create?
    is_fund_manager?
  end

  def update?
    is_fund_manager?
  end

  def destroy?
    user.admin?
  end

  private

  def is_fund_manager?
    user.present? && user.spaces.where(name: 'Fund Manager').present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
