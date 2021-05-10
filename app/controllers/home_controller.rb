class HomeController < ApplicationController

    #display all organizations
    def index
        @organizations = Organization.all
    end
end