class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.boolean :done, default: false
      t.integer :priority, default: 1

      t.timestamps
    end
  end
end
