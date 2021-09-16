class Report < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :therapist
  belongs_to :proposal
end
