class BookPolicy < ApplicationPolicy
  def new?
    user.is_librarian?
  end

  def create?
    user.is_librarian?
  end

  def edit?
    user.is_librarian?
  end

  def update?
    user.is_librarian?
  end

  def destroy?
    user.is_librarian?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
