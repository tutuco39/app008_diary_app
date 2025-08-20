class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries do |t|
      t.date :date
      t.string :title
      t.text :body
      t.integer :mood
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
