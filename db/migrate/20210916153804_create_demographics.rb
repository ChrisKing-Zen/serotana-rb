class CreateDemographics < ActiveRecord::Migration[6.1]
  def change
    create_table :demographics do |t|
      t.string :name
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
