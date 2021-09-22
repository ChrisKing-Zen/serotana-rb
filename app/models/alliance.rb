class Alliance < ApplicationRecord
  belongs_to :therapist,
             class_name: 'therapist',
             foreign_key: 'therapist_id',
             optional: true
end
