class RemoveColumnFromShifts < ActiveRecord::Migration[6.1]
  def change
    remove_column :shifts, :break_length
  end
end
