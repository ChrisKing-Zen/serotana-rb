class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.boolean :seen_therapist
      t.boolean :taking_meds
      t.string :country
      t.string :city
      t.string :state
      t.date :birth_date
      t.integer :onboarding_step
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
