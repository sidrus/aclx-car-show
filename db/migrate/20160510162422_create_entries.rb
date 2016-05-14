class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :entryType
      t.date :entryDate
      t.string :judgingClass

      t.timestamps null: false
    end
  end
end
