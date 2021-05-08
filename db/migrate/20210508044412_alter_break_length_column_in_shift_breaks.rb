class AlterBreakLengthColumnInShiftBreaks < ActiveRecord::Migration[6.1]
  def change
    change_column :shift_breaks, :break_length, :integer,null: true, default: 0
  end
end
