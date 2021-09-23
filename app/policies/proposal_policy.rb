class ProposalPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  def therapist_index
    user.admin?
    user.therapist?
  end

  def client_index
    user.admin?
    user.client?
  end

  def show?
    user.admin?
    user.client? && (user.role_id == record.post.client_id)
    user.therapist? && (user.role_id == record.therapist_id)
  end

  #
  def update?
    # here we can access our context and record
    user.admin? || (user.role_id == record.therapist_id)
  end

  def destroy?
    user.admin? || (user.role_id == record.therapist_id)
  end

  def create?
    user.therapist?
  end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end
end
