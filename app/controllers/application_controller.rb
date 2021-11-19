class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_project, only: %i[ show edit update destroy ]
end
