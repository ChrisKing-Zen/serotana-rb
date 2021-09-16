class Name < ApplicationRecord
  belongs_to :client
  belongs_to :therapist
  belongs_to :user
end
