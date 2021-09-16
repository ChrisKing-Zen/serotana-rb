class CreateInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :insurances do |t|
      t.string :name
      t.string :state
      t.string :country
      t.references :client, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
