class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def index
  end

  def create
    @profile = get_profile
    redirect_to @profile
  end

  private 
  def get_profile
    Profile.where(handle: handle).last || ProfileDownloader.new(handle).save!
  end

  def handle
    profile_params['handle']
  end
  
  def profile_params
    params.require(:profile).permit(:handle)
  end
end
