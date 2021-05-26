class OrganizationShift < ApplicationRecord

    belongs_to :shifts
    belongs_to :organization
end
