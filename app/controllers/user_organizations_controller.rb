class UserOrganizationsController < ApplicationController
    
    def assign_organization
        user = User.find(current_user.id)
        if user.update(user_params)
            redirect_to root_path, notice: "Organization joined."
        else
            render :show, status: :ok, location: root_path
        end
    end


    def remove_organization
        user = User.find(current_user.id)

        if user.update(organization_id: nil)
            redirect_to root_path, notice: "You just left organization."
        else
            render :show, status: :ok, location: root_path
        end
    end

    
    private
    def user_params
        params.require(:user).permit(:organization_id)
    end
end