require 'rails_helper'

# rspec ./spec/auth/post_auth.rb
describe PostPolicy do
  let(:user) { build_stubbed :user }

  # `record` must be defined – it is the authorization target
  let(:record) { build_stubbed :post, draft: false }

  # `context` is the authorization context
  let(:context) { { user: user } }

  # `describe_rule` is a combination of
  # `describe` and `subject { ... }` (returns the result of
  # applying the rule to the record)
  describe_rule :show? do
    # `succeed` is `context` + `specify`, which checks
    # that the result of application is successful
    succeed 'when post is published'

    # `failed` is `context` + `specify`, which checks
    # that the result of application wasn't successful
    failed 'when post is draft' do
      before { post.draft = false }

      succeed 'when user is a manager' do
        before { user.role = 'manager' }
      end
    end
  end
end
