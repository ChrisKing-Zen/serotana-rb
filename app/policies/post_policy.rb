class PostPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  # def index?
  #   true
  # end
  #
  def update?
    # here we can access our context and record
    user.admin?
    user.client? && (user.role_id == record.client_id)
  end

  def destroy?
    # here we can access our context and record
    user.admin?
    user.client? && (user.role_id == record.client_id)
  end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end
end
