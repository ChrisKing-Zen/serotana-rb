class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
