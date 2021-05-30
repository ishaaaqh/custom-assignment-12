class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @current_user = current_user
        p session
    end
end
