class ProfilesController < ApplicationController
  def show

  end

  def index
    @profile = Profile.new
  end

  def create 
    @profile = Profile.new(handle: params[:handle])
  end
end
