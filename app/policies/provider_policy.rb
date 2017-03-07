class ProviderPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    user.id == record.id
  end

  def update?
    user.id == record.id || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    edit?
  end


end
