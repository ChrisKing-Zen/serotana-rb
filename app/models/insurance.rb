class Insurance < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :therapist, optional: true
end
