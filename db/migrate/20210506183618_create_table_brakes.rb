class CreateTableBrakes < ActiveRecord::Migration[6.1]
  def change
    create_table :breaks do |t|
      t.references :shift, null: false, foreign_key: true
      t.integer :break_length, null: false, default: 0
      
      t.timestamps
    end
  end
end
