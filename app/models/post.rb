class Post < ApplicationRecord
  has_many :specialized_issues
  has_many :proposals
  belongs_to :client
end
