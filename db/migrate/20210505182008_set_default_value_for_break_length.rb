class SetDefaultValueForBreakLength < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :break_length, :integer, :default => 0
  end
end
