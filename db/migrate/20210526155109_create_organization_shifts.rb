class CreateOrganizationShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_shifts do |t|
      t.references :organization
      t.references :shift

      t.timestamps
    end
  end
end
