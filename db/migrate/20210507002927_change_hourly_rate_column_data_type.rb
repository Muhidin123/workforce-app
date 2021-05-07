class ChangeHourlyRateColumnDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :organizations, :hourly_rate, :float, null: false, default: 0.0
  end
end
