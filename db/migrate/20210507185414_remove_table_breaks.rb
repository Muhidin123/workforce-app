class RemoveTableBreaks < ActiveRecord::Migration[6.1]
  def change
    drop_table :breaks
  end
end
