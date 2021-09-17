class SpecializedIssue < ApplicationRecord
  belongs_to :therapist, optional: true
  belongs_to :post, optional: true
end
