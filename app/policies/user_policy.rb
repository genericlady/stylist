class UserPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.id == record.id
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

end
