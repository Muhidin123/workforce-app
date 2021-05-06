class AddAdditionalConstrainsToDb < ActiveRecord::Migration[6.1]
  def change
    change_column :organizations, :name, :string, :null => false
    change_column :organizations, :hourly_rate, :integer, :null => false
  end
end
