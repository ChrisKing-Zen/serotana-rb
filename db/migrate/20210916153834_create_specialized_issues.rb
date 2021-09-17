class CreateSpecializedIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :specialized_issues do |t|
      t.string :name
      t.references :therapist, null: true, foreign_key: true
      t.references :post, null: true, foreign_key: true

      t.timestamps
    end
  end
end
