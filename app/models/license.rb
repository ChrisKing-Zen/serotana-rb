class License < ApplicationRecord
  belongs_to :user
  belongs_to :therapist
end
