module Types
  class ProposalType < Types::BaseObject
    field :id, ID, null: false
    field :message, String, null: true
    field :status, String, null: true
    field :post, Types::PostType, null: false
    field :therapist, Types::TherapistType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
