class AddOrganizationReferenceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :organization, default: nil, null: true, foreign_key: true
  end
end
