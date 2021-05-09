class CreateUserOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_organizations do |t|
      t.references :organization, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
