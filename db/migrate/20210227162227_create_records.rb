class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :title
      t.integer :year
      t.integer :condition

      t.timestamps
    end
  end

end
