class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :message
      t.string :reporter_email
      t.boolean :resolved
      t.string :admin_comments
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true
      t.references :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
