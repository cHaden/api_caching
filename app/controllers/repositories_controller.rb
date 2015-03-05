class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by_username(params[:username]) ||
        Profile.create_from_username(params[:username])
    # @repositories = RepositoryList.create_from_profile_id(params[:username], @profile.id)

        # @repositories = ObjectSpace._id2ref(@profile.repository_list.to_i)
    # @repositories = RepositoryList.new(params[:username]).repositories
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
