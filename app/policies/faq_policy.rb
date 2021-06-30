class FaqPolicy < ApplicationPolicy

  def index?
    is_content_editor?
  end

  def paths?
    true
  end

  def show?
    true
  end

  def new?
    is_content_editor?
  end

  def edit?
    is_content_editor?
  end

  def create?
    is_content_editor?
  end

  def update?
    is_content_editor?
  end

  def destroy?
    user.admin?
  end

  private

  def is_content_editor?
    user.present? && user.spaces.where(name: 'Content Editor').present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
