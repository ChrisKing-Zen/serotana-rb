class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.text :message
      t.string :status

      t.references :post, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true
      t.timestamps
    end
  end
end
