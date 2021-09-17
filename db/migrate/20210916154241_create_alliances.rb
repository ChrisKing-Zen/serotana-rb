class CreateAlliances < ActiveRecord::Migration[6.1]
  def change
    create_table :alliances do |t|
      t.string :name
      t.string :description
      t.string :url
      t.references :therapist, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
