class LicensePolicy < ApplicationPolicy

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
    true if user.id == record.user_id
  end

  def create?
    true if user.id == record.user_id || user.admin?
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
    true if record.user_id == user.id || user.admin?
  end

end
