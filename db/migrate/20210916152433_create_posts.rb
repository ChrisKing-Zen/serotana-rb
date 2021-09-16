class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :problems
      t.string :expectations
      t.string :further_info
      t.string :setting_preference
      t.integer :min_budget
      t.integer :max_budget
      t.boolean :is_insured
      t.boolean :out_of_pocket_only
      t.boolean :active
      t.boolean :acquired_here
      t.boolean :anonymize
      t.date :anonmyization_date

      t.timestamps
    end
  end
end
