module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :problems, String, null: true
    field :expectations, String, null: true
    field :further_info, String, null: true
    field :setting_preference, String, null: true
    field :min_budget, Integer, null: true
    field :max_budget, Integer, null: true
    field :is_insured, Boolean, null: true
    field :out_of_pocket_only, Boolean, null: true
    field :active, Boolean, null: true
    field :acquired_here, Boolean, null: true
    field :anonymize, Boolean, null: true
    field :anonymization_date, GraphQL::Types::ISO8601Date, null: true
    field :client, Types::ClientType, null: false, authorized_scope: true
    field :proposals, [Types::ProposalType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
