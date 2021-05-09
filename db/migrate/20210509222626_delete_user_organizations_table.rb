class DeleteUserOrganizationsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_organizations
  end
end
