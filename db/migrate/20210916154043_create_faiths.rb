class CreateFaiths < ActiveRecord::Migration[6.1]
  def change
    create_table :faiths do |t|
      t.string :name
      t.references :client, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
