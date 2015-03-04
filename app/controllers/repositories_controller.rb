class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by_username(params[:username]) ||
        Profile.create_from_username(params[:username])
    @repositories = RepositoryList.new(params[:username]).repositories
  end

  # def show
  #   @profile = Profile.new(params[:username])
  #   if @profile.username.blank?
  #     redirect_to root_path
  #   else
  #     @repositories = RepositoryList.new(params[:username]).repositories
  #   end
  # end

end
