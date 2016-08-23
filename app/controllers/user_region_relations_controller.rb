class UserRegionRelationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region
  before_action :set_user

  #subscribes to a region
  def subscribe
    @user.subscribe!(@region)
    redirect_back(fallback_location: root_path)
  end

  #unsubscribes to a region
  def unsubscribe
    @subscription = @user.preferred_regions.find_by(params[:id])
    @user.preferred_regions.delete(@subscription)
    redirect_back(fallback_location: root_path)
  end

  private

  #sets region to instance variable
  def set_region
    @region = Region.find(params[:region_id])
  end

  #sets user to instance variable
  def set_user
    @user = current_user
  end
end
